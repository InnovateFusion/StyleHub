import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/captilizations.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/search.dart';
import 'package:style_hub/setUp/size/app_size.dart';

import '../../../domain/entities/brand_entity.dart';
import '../../bloc/prdoct_filter/product_filter_bloc.dart';
import '../../bloc/product/product_bloc.dart';
import '../../widgets/filter/bottom_filter_bar.dart';

class BrandFullFilterScreen extends StatefulWidget {
  const BrandFullFilterScreen(
      {super.key, required this.isAdd, required this.onTap});

  final bool isAdd;
  final Function() onTap;

  @override
  _BrandScreenState createState() => _BrandScreenState();
}

class _BrandScreenState extends State<BrandFullFilterScreen> {
  bool _shouldPop = false;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    super.initState();

    searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    List<BrandEntity> filterBrand() {
      List<BrandEntity> brands = context.watch<ProductBloc>().state.brands;
      if (searchController.text.isEmpty) return brands;
      return brands
          .where((brand) => brand.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }

    List<BrandEntity> brands = filterBrand();

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification && !_shouldPop) {
              if (notification.metrics.pixels < -120) {
                setState(() {
                  _shouldPop = true;
                });
                Navigator.pop(context, true);
              }
            }
            return false;
          },
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(
                  horizontal: AppSize.smallSize,
                  vertical: AppSize.smallSize,
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Theme.of(context)
                          .colorScheme
                          .onSurface
                          .withOpacity(0.1),
                      width: 0.5,
                    ),
                  ),
                ),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: Icon(
                        Icons.close_rounded,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    const SizedBox(width: AppSize.smallSize),
                    Search(
                      title: "Search Brand",
                      controller: searchController,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    if (context.watch<ProductBloc>().state.brandStatus ==
                        BrandStatus.loading)
                      const Expanded(
                          child: Center(child: CircularProgressIndicator())),
                    if (context.watch<ProductBloc>().state.brandStatus ==
                        BrandStatus.success)
                      Expanded(
                        child: ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: const EdgeInsets.symmetric(
                              horizontal: AppSize.smallSize,
                            ),
                            itemBuilder: (context, index) {
                              return Container(
                                width: double.infinity,
                                margin: const EdgeInsets.only(
                                    top: AppSize.smallSize),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 30,
                                      height: 30,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                            context
                                                .watch<ProductBloc>()
                                                .state
                                                .brands[index]
                                                .logo,
                                          ),
                                          fit: BoxFit.cover,
                                        ),
                                        borderRadius: BorderRadius.circular(
                                            AppSize.xxSmallSize),
                                      ),
                                    ),
                                    const SizedBox(width: AppSize.smallSize),
                                    Text(
                                      Captilizations.capitalize(
                                          brands[index].name),
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(
                                            color: Theme.of(context)
                                                .colorScheme
                                                .onSurface,
                                          ),
                                    ),
                                    const Spacer(),
                                    Checkbox(
                                      value: context
                                          .watch<ProductFilterBloc>()
                                          .state
                                          .selectedBrands
                                          .contains(
                                            brands[index].id,
                                          ),
                                      onChanged: (value) {
                                        if (value != null) {
                                          final brandId = brands[index].id;
                                          if (context
                                              .read<ProductFilterBloc>()
                                              .state
                                              .selectedBrands
                                              .contains(brandId)) {
                                            context
                                                .read<ProductFilterBloc>()
                                                .add(RemoveSelectedBrandEvent(
                                                    brandId));
                                          } else {
                                            context
                                                .read<ProductFilterBloc>()
                                                .add(AddSelectedBrandEvent(
                                                    brandId));
                                          }
                                        }
                                      },
                                    ),
                                  ],
                                ),
                              );
                            },
                            itemCount: brands.length),
                      ),
                    Container(
                      padding: const EdgeInsets.all(AppSize.smallSize),
                      decoration: BoxDecoration(
                        border: Border(
                          top: BorderSide(
                            color: Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.1),
                            width: 0.5,
                          ),
                        ),
                      ),
                      child: BottomFilterBar(
                          isAdd: widget.isAdd,
                          onTapClear: () {
                            context
                                .read<ProductFilterBloc>()
                                .add(ClearSelectedBrandsEvent());
                          },
                          onTapResult: () {
                            widget.onTap();
                            Navigator.pop(context, true);
                          }),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
