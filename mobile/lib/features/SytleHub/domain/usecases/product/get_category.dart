import 'package:either_dart/either.dart';
import 'package:style_hub/core/errors/failure.dart';
import 'package:style_hub/core/use_cases/usecase.dart';

import '../../entities/category_entity.dart';
import '../../repositories/product.dart';

class GetCategoriesUseCase extends UseCase<List<CategoryEntity>, NoParams> {
  final ProductRepository repository;

  GetCategoriesUseCase(this.repository);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(NoParams params) async {
    return await repository.getCategories();
  }
}
