import 'package:either_dart/either.dart';
import 'package:style_hub/core/errors/failure.dart';
import 'package:style_hub/core/use_cases/usecase.dart';
import 'package:style_hub/features/SytleHub/domain/entities/location_entity.dart';

import '../../repositories/product.dart';

class GetLocationUseCase extends UseCase<List<LocationEntity>, NoParams> {
  final ProductRepository repository;

  GetLocationUseCase(this.repository);

  @override
  Future<Either<Failure, List<LocationEntity>>> call(NoParams params) async {
    return await repository.getLocations();
  }
}
