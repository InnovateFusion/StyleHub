using AutoMapper;
using backend.Application.Contracts.Persistence;
using backend.Application.DTO.Common.Chat.DTO;
using backend.Application.Exceptions;
using backend.Application.Features.Common_Features.Chat.Requests.Commads;
using MediatR;

namespace backend.Application.Features.Common_Features.Chat.Handlers.Commands;

public class DeleteChatByIdHandler(IUnitOfWork unitOfWork, IMapper mapper)
    : IRequestHandler<DeleteChatByIdRequest, ChatResponseDTO>
{
    public async Task<ChatResponseDTO> Handle(DeleteChatByIdRequest request, CancellationToken cancellationToken)
    {
        var chat = await unitOfWork.ChatRepository.GetById(request.Id);
        if (chat == null)
        {
            throw new NotFoundException("Chat not found");
        }

        await unitOfWork.ChatRepository.Delete(chat);
        return mapper.Map<ChatResponseDTO>(chat);
    }
}
