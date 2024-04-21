using backend.Application.Contracts.Persistence.Repositories.User;
using backend.Application.DTO.Common.Chat.DTO;
using FluentValidation;

namespace backend.Application.DTO.Common.Chat.Validations;

public class CreateChatDtoValidation: AbstractValidator<CreateChatDTO>
{
    IUserRepository _userRepository;
    string[] Type = { "text", "image"};

    public CreateChatDtoValidation(IUserRepository UserRepository)
    {
        _userRepository = UserRepository;

        RuleFor(x => x.Message)
            .NotNull()
            .WithMessage("Message is required")
            .NotEmpty()
            .WithMessage("Message cannot be empty");

        RuleFor(x => x.Type)
            .NotNull()
            .WithMessage("Type is required")
            .NotEmpty()
            .WithMessage("Type cannot be empty")
            .Must(x => Type.Contains(x))
            .WithMessage("Type must be text or image");

        RuleFor(x => x.ReceiverId)
            .NotEmpty()
            .When(x => x.ReceiverId != null)
            .WithMessage("ReceiverId cannot be empty")
            .MustAsync(
                async (receiverId, cancellation) =>
                {
                    if (receiverId == null)
                        return true;
                    return await _userRepository.GetById(receiverId) != null;
                }
            ).When(x => x.ReceiverId != null)
            . WithMessage("ReceiverId does not exist");
    }
}