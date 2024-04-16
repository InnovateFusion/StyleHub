import 'package:bloc/bloc.dart';
import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:stream_transform/stream_transform.dart';
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_brand.dart'
    as brand_usecase;
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_category.dart'
    as category_usecase;
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_color.dart'
    as color_usecase;
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_location.dart'
    as location_usecase;
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_material.dart'
    as material_usecase;
import 'package:style_hub/features/SytleHub/domain/usecases/product/get_size.dart'
    as size_usecase;

import '../../../../../core/use_cases/usecase.dart';
import '../../../domain/entities/brand_entity.dart';
import '../../../domain/entities/category_entity.dart';
import '../../../domain/entities/color_entity.dart';
import '../../../domain/entities/location_entity.dart';
import '../../../domain/entities/material_entity.dart';
import '../../../domain/entities/size_entity.dart';

part 'product_event.dart';
part 'product_state.dart';

const throttleDuration = Duration(milliseconds: 100);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttle(duration), mapper);
  };
}

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final color_usecase.GetColorsUseCase getColorsUseCase;
  final brand_usecase.GetBrandsUseCase getBrandsUseCase;
  final material_usecase.GetMaterialsUseCase getMaterialsUseCase;
  final size_usecase.GetSizesUseCase getSizesUseCase;
  final category_usecase.GetCategoriesUseCase getCategoriesUseCase;
  final location_usecase.GetLocationUseCase getLocationUseCase;

  ProductBloc({
    required this.getColorsUseCase,
    required this.getBrandsUseCase,
    required this.getMaterialsUseCase,
    required this.getSizesUseCase,
    required this.getCategoriesUseCase,
    required this.getLocationUseCase,
  }) : super(const ProductState()) {
    on<GetColorsEvent>(_onGetColors,
        transformer: throttleDroppable(throttleDuration));

    on<GetBrandsEvent>(_onGetBrands,
        transformer: throttleDroppable(throttleDuration));
    on<GetMaterialsEvent>(_onGetMaterials,
        transformer: throttleDroppable(throttleDuration));
    on<GetSizesEvent>(_onGetSizes,
        transformer: throttleDroppable(throttleDuration));
    on<GetCategoriesEvent>(_onGetCategories,
        transformer: throttleDroppable(throttleDuration));
    on<GetLocationsEvent>(_onGetLocations,
        transformer: throttleDroppable(throttleDuration));
  }

  void _onGetColors(GetColorsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(colorStatus: ColorStatus.loading));

    final result = await getColorsUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(colorStatus: ColorStatus.failure)),
      (colors) => emit(
          state.copyWith(colors: colors, colorStatus: ColorStatus.success)),
    );
  }

  void _onGetBrands(GetBrandsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(brandStatus: BrandStatus.loading));

    final result = await getBrandsUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(brandStatus: BrandStatus.failure)),
      (brands) => emit(
          state.copyWith(brands: brands, brandStatus: BrandStatus.success)),
    );
  }

  void _onGetMaterials(
      GetMaterialsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(materialStatus: MaterialStatus.loading));

    final result = await getMaterialsUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(materialStatus: MaterialStatus.failure)),
      (materials) => emit(state.copyWith(
          materials: materials, materialStatus: MaterialStatus.success)),
    );
  }

  void _onGetSizes(GetSizesEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(sizeStatus: SizeStatus.loading));

    final result = await getSizesUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(sizeStatus: SizeStatus.failure)),
      (sizes) =>
          emit(state.copyWith(sizes: sizes, sizeStatus: SizeStatus.success)),
    );
  }

  void _onGetCategories(
      GetCategoriesEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(categoryStatus: CategoryStatus.loading));

    final result = await getCategoriesUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(categoryStatus: CategoryStatus.failure)),
      (categories) => emit(state.copyWith(
          categories: categories, categoryStatus: CategoryStatus.success)),
    );
  }

  void _onGetLocations(
      GetLocationsEvent event, Emitter<ProductState> emit) async {
    emit(state.copyWith(locationStatus: LocationStatus.loading));

    final result = await getLocationUseCase(NoParams());

    result.fold(
      (failure) => emit(state.copyWith(locationStatus: LocationStatus.failure)),
      (locations) => emit(state.copyWith(
          locations: locations, locationStatus: LocationStatus.success)),
    );
  }
}
