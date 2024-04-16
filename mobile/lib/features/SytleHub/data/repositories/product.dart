import 'package:either_dart/either.dart';
import 'package:style_hub/core/errors/failure.dart';
import 'package:style_hub/features/SytleHub/domain/entities/brand_entity.dart';
import 'package:style_hub/features/SytleHub/domain/entities/category_entity.dart';
import 'package:style_hub/features/SytleHub/domain/entities/color_entity.dart';
import 'package:style_hub/features/SytleHub/domain/entities/location_entity.dart';
import 'package:style_hub/features/SytleHub/domain/entities/material_entity.dart';
import 'package:style_hub/features/SytleHub/domain/entities/size_entity.dart';
import 'package:style_hub/features/SytleHub/domain/repositories/product.dart';

import '../../../../core/errors/exception.dart';
import '../../../../core/network/internet.dart';
import '../datasources/remote/product.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;

  ProductRepositoryImpl({
    required this.remoteDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<ColorEntity>>> getColors() async {
    if (await networkInfo.isConnected) {
      try {
        final colors = await remoteDataSource.getColors();
        return Right(colors);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    if (await networkInfo.isConnected) {
      try {
        final brands = await remoteDataSource.getBrands();
        return Right(brands);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    if (await networkInfo.isConnected) {
      try {
        final categories = await remoteDataSource.getCategories();
        return Right(categories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<MaterialEntity>>> getMaterials() async {
    if (await networkInfo.isConnected) {
      try {
        final materials = await remoteDataSource.getMaterials();
        return Right(materials);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<SizeEntity>>> getSizes() async {
    if (await networkInfo.isConnected) {
      try {
        final sizes = await remoteDataSource.getSizes();
        return Right(sizes);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, List<LocationEntity>>> getLocations() async {
    if (await networkInfo.isConnected) {
      try {
        final locations = await remoteDataSource.getLocations();
        return Right(locations);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      return Left(CacheFailure());
    }
  }
}
