import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_color.dart';

import 'core/network/internet.dart';
import 'features/SytleHub/data/datasources/remote/product.dart';
import 'features/SytleHub/data/repositories/product.dart';
import 'features/SytleHub/domain/repositories/product.dart';
import 'features/SytleHub/domain/usecases/product/get_brand.dart';
import 'features/SytleHub/domain/usecases/product/get_category.dart';
import 'features/SytleHub/domain/usecases/product/get_location.dart';
import 'features/SytleHub/domain/usecases/product/get_material.dart';
import 'features/SytleHub/domain/usecases/product/get_size.dart';
import 'features/SytleHub/presentation/bloc/product/product_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  // Features
  // - Product
  sl.registerFactory(() => ProductBloc(
        getColorsUseCase: sl(),
        getBrandsUseCase: sl(),
        getMaterialsUseCase: sl(),
        getSizesUseCase: sl(),
        getCategoriesUseCase: sl(),
        getLocationUseCase: sl(),
      ));

  // Use cases
  // - Product
  sl.registerLazySingleton(() => GetColorsUseCase(sl()));
  sl.registerLazySingleton(() => GetBrandsUseCase(sl()));
  sl.registerLazySingleton(() => GetMaterialsUseCase(sl()));
  sl.registerLazySingleton(() => GetSizesUseCase(sl()));
  sl.registerLazySingleton(() => GetCategoriesUseCase(sl()));
  sl.registerLazySingleton(() => GetLocationUseCase(sl()));

  // Repository
  // - Product
  sl.registerLazySingleton<ProductRepository>(
    () => ProductRepositoryImpl(remoteDataSource: sl(), networkInfo: sl()),
  );

  // Data sources - Remote
  // - Product
  sl.registerLazySingleton<ProductRemoteDataSource>(
      () => ProductRemoteDataSourceImpl(client: sl()));

  // Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  // External
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => InternetConnectionChecker());
}
