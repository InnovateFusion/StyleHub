import 'package:either_dart/either.dart';
import 'package:style_hub/core/errors/failure.dart';
import 'package:style_hub/core/use_cases/usecase.dart';
import 'package:style_hub/features/SytleHub/domain/entities/material_entity.dart';

import '../../repositories/product.dart';

class GetMaterialsUseCase extends UseCase<List<MaterialEntity>, NoParams> {
  final ProductRepository repository;

  GetMaterialsUseCase(this.repository);

  @override
  Future<Either<Failure, List<MaterialEntity>>> call(NoParams params) async {
    return await repository.getMaterials();
  }
}
