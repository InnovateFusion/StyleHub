import 'package:either_dart/either.dart';
import 'package:style_hub/core/errors/failure.dart';
import 'package:style_hub/core/use_cases/usecase.dart';

import '../../entities/size_entity.dart';
import '../../repositories/product.dart';

class GetSizesUseCase extends UseCase<List<SizeEntity>, NoParams> {
  final ProductRepository repository;

  GetSizesUseCase(this.repository);

  @override
  Future<Either<Failure, List<SizeEntity>>> call(NoParams params) async {
    return await repository.getSizes();
  }
}
