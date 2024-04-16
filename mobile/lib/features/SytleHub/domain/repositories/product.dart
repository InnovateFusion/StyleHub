import 'package:either_dart/either.dart';
import 'package:style_hub/features/SytleHub/domain/entities/brand_entity.dart';
import 'package:style_hub/features/SytleHub/domain/entities/color_entity.dart';

import '../../../../core/errors/failure.dart';
import '../entities/category_entity.dart';
import '../entities/location_entity.dart';
import '../entities/material_entity.dart';
import '../entities/size_entity.dart';

abstract class ProductRepository {
  Future<Either<Failure, List<ColorEntity>>> getColors();
  Future<Either<Failure, List<BrandEntity>>> getBrands();
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<SizeEntity>>> getSizes();
  Future<Either<Failure, List<MaterialEntity>>> getMaterials();
  Future<Either<Failure, List<LocationEntity>>> getLocations();
}
