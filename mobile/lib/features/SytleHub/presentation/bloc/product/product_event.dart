part of 'product_bloc.dart';

@immutable
sealed class ProductEvent {}

class GetColorsEvent extends ProductEvent {
  GetColorsEvent();
}

class GetSizesEvent extends ProductEvent {
  GetSizesEvent();
}

class GetCategoriesEvent extends ProductEvent {
  GetCategoriesEvent();
}

class GetBrandsEvent extends ProductEvent {
  GetBrandsEvent();
}

class GetMaterialsEvent extends ProductEvent {
  GetMaterialsEvent();
}

class GetLocationsEvent extends ProductEvent {
  GetLocationsEvent();
}