using AutoMapper;
using backend.Application.Contracts.Infrastructure.Services;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Common.Chat.DTO;
using backend.Application.DTO.Common.Chat.Validations;
using backend.Application.Exceptions;
using backend.Application.Features.Common_Features.Chat.Requests.Commads;
using MediatR;
using Newtonsoft.Json;

namespace backend.Application.Features.Common_Features.Chat.Handlers.Commands;

public class CreateChatHandler(IUnitOfWork unitOfWork, IMapper mapper, IRabbitMQService rabbitMQService, ICacheService cacheService)
    : IRequestHandler<CreateChatRequest, ChatResponseDTO>
{
    public async Task<ChatResponseDTO> Handle(CreateChatRequest request, CancellationToken cancellationToken)
    {
        var validator = new CreateChatDtoValidation();
        var validationResult = await validator.ValidateAsync(request.Chat!);
        if (!validationResult.IsValid)
            throw new BadRequestException(
                validationResult.Errors.FirstOrDefault()?.ErrorMessage!
            );
        string id = Guid.NewGuid().ToString();
        var dateTime = DateTime.Now;
        if (await cacheService.KeyExists($"{request.Chat.ReceiverId}-data"))
        {
            var senderData = await cacheService.Get<RealTimeChatUserDataDTO>($"{request.SenderId}-data");
            var receiverData = await cacheService.Get<RealTimeChatUserDataDTO>($"{request.Chat.ReceiverId}-data");  
            var message = SterilizeMessage(id, request.Chat.Message, request.Chat.Type, senderData, receiverData, dateTime);
            rabbitMQService.PublishMessageAsync("chat", "chat", "chat", message);
        }

        var sender = await unitOfWork.UserRepository.GetById(request.SenderId);
        var receiver = await unitOfWork.UserRepository.GetById(request.Chat.ReceiverId);
        var chat = new Domain.Entities.Common.Chat
        {
            Id = id,
            Message = request.Chat.Message,
            Type = request.Chat.Type,
            Sender = sender,
            Receiver = receiver,
            CreatedAt = dateTime
        };
        chat = await unitOfWork.ChatRepository.Add(chat);
        return mapper.Map<ChatResponseDTO>(chat);
    }

    private string SterilizeMessage( string id, string message, string type, RealTimeChatUserDataDTO sender, RealTimeChatUserDataDTO receiver, DateTime dateTime)
    {
        var json = new RealTimeChatDTO
        {
            Id = id,
            Message = message,
            Type = type,
            Sender = sender,
            Receiver = receiver,
            IsRead = false,
            CreatedAt = dateTime,
        };
        return JsonConvert.SerializeObject(json);
    }
}