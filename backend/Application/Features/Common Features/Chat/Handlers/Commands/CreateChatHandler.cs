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

public class CreateChatHandler(IUnitOfWork unitOfWork, IMapper mapper, IRabbitMQService rabbitMQService)
    : IRequestHandler<CreateChatRequest, ChatResponseDTO>
{
    public async Task<ChatResponseDTO> Handle(CreateChatRequest request, CancellationToken cancellationToken)
    {
        var validator = new CreateChatDtoValidation(unitOfWork.UserRepository);
        var validationResult = await validator.ValidateAsync(request.Chat!);
        if (!validationResult.IsValid)
            throw new BadRequestException(
                validationResult.Errors.FirstOrDefault()?.ErrorMessage!
            );

        var sender = await unitOfWork.UserRepository.GetById(request.SenderId);
        var receiver = await unitOfWork.UserRepository.GetById(request.Chat.ReceiverId);
        var chat = new Domain.Entities.Common.Chat
        {
            Message = request.Chat.Message,
            Type = request.Chat.Type,
            Sender = sender,
            Receiver = receiver
        };
        var newChat = mapper.Map<ChatResponseDTO>(chat);
        rabbitMQService.PublishMessageAsync("chat", "chat", "chat", SterilizeMessage(newChat));
        chat = await unitOfWork.ChatRepository.Add(chat);
        return mapper.Map<ChatResponseDTO>(chat);
    }

    private string SterilizeMessage(ChatResponseDTO chat)
    {
        string json = JsonConvert.SerializeObject(chat);
        return json;
    }
}