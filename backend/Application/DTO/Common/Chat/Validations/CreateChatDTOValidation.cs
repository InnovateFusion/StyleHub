using backend.Application.Contracts.Persistence.Repositories.User;
using backend.Application.DTO.Common.Chat.DTO;
using FluentValidation;

namespace backend.Application.DTO.Common.Chat.Validations;

public class CreateChatDtoValidation: AbstractValidator<CreateChatDTO>
{
    string[] Type = { "text", "image"};

    public CreateChatDtoValidation()
    {
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
    }
}