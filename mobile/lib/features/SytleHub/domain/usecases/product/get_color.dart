import 'package:style_hub/core/errors/failure.dart';
import 'package:style_hub/core/use_cases/usecase.dart';
import 'package:either_dart/either.dart';
import '../../entities/color_entity.dart';
import '../../repositories/product.dart';

class GetColorsUseCase extends UseCase<List<ColorEntity>, NoParams> {
  final ProductRepository repository;

  GetColorsUseCase(this.repository);

  @override
  Future<Either<Failure, List<ColorEntity>>> call(NoParams params) async {
    return await repository.getColors();
  }
}
