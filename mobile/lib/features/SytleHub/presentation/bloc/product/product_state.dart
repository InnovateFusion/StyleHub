part of 'product_bloc.dart';

enum ColorStatus { initial, loading, success, failure }

enum SizeStatus { initial, loading, success, failure }

enum CategoryStatus { initial, loading, success, failure }

enum BrandStatus { initial, loading, success, failure }

enum MaterialStatus { initial, loading, success, failure }

enum LocationStatus { initial, loading, success, failure }

class ProductState extends Equatable {
  final List<ColorEntity> colors;
  final ColorStatus colorStatus;
  final List<SizeEntity> sizes;
  final SizeStatus sizeStatus;
  final List<CategoryEntity> categories;
  final CategoryStatus categoryStatus;
  final List<BrandEntity> brands;
  final BrandStatus brandStatus;
  final List<MaterialEntity> materials;
  final MaterialStatus materialStatus;
  final List<LocationEntity> locations;
  final LocationStatus locationStatus;

  const ProductState({
    this.colors = const <ColorEntity>[],
    this.colorStatus = ColorStatus.initial,
    this.sizes = const <SizeEntity>[],
    this.sizeStatus = SizeStatus.initial,
    this.categories = const <CategoryEntity>[],
    this.categoryStatus = CategoryStatus.initial,
    this.brands = const <BrandEntity>[],
    this.brandStatus = BrandStatus.initial,
    this.materials = const <MaterialEntity>[],
    this.materialStatus = MaterialStatus.initial,
    this.locations = const <LocationEntity>[],
    this.locationStatus = LocationStatus.initial,
  });

  ProductState copyWith({
    List<ColorEntity>? colors,
    ColorStatus? colorStatus,
    List<SizeEntity>? sizes,
    SizeStatus? sizeStatus,
    List<CategoryEntity>? categories,
    CategoryStatus? categoryStatus,
    List<BrandEntity>? brands,
    BrandStatus? brandStatus,
    List<MaterialEntity>? materials,
    MaterialStatus? materialStatus,
    List<LocationEntity>? locations,
    LocationStatus? locationStatus,
  }) {
    return ProductState(
      colors: colors ?? this.colors,
      colorStatus: colorStatus ?? this.colorStatus,
      sizes: sizes ?? this.sizes,
      sizeStatus: sizeStatus ?? this.sizeStatus,
      categories: categories ?? this.categories,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      brands: brands ?? this.brands,
      brandStatus: brandStatus ?? this.brandStatus,
      materials: materials ?? this.materials,
      materialStatus: materialStatus ?? this.materialStatus,
      locations: locations ?? this.locations,
      locationStatus: locationStatus ?? this.locationStatus,
    );
  }

  @override
  List<Object?> get props => [
        colors,
        colorStatus,
        sizes,
        sizeStatus,
        categories,
        categoryStatus,
        brands,
        brandStatus,
        materials,
        materialStatus,
        locations,
        locationStatus,
      ];
}
