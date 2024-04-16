import 'dart:convert';

import 'package:http/http.dart' show Client;
import 'package:style_hub/core/errors/exception.dart';
import 'package:style_hub/features/SytleHub/data/models/brand_model.dart';
import 'package:style_hub/features/SytleHub/data/models/color_model.dart';
import 'package:style_hub/features/SytleHub/data/models/location_model.dart';
import 'package:style_hub/setUp/url/urls.dart';

import '../../models/category_model.dart';
import '../../models/material_model.dart';
import '../../models/size_model.dart';

abstract class ProductRemoteDataSource {
  Future<List<ColorModel>> getColors();
  Future<List<BrandModel>> getBrands();
  Future<List<CategoryModel>> getCategories();
  Future<List<SizeModel>> getSizes();
  Future<List<MaterialModel>> getMaterials();
  Future<List<LocationModel>> getLocations();
}

class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final Client client;

  ProductRemoteDataSourceImpl({required this.client});

  @override
  Future<List<ColorModel>> getColors() async {
    final response = await client.get(Uri.parse(Urls.color));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => ColorModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<BrandModel>> getBrands() async {
    final response = await client.get(Uri.parse(Urls.brand));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => BrandModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<CategoryModel>> getCategories() async {
    final response = await client.get(Uri.parse(Urls.category));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => CategoryModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<MaterialModel>> getMaterials() async {
    final response = await client.get(Uri.parse(Urls.material));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => MaterialModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<SizeModel>> getSizes() async {
    final response = await client.get(Uri.parse(Urls.size));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => SizeModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }

  @override
  Future<List<LocationModel>> getLocations() async {
    final response = await client.get(Uri.parse(Urls.location));
    if (response.statusCode == 200) {
      return (json.decode(response.body) as List)
          .map((e) => LocationModel.fromJson(e))
          .toList();
    } else {
      throw ServerException();
    }
  }
}
