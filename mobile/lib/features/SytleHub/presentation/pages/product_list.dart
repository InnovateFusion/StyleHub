import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/SytleHub/presentation/pages/filter/brand.dart';
import 'package:style_hub/features/SytleHub/presentation/pages/filter/color.dart';
import 'package:style_hub/features/SytleHub/presentation/pages/filter/location.dart';
import 'package:style_hub/features/SytleHub/presentation/pages/filter/sort.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/button.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/filter/half_brand_filter.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/filter/half_color_filter.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/filter/half_sort_filter.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/filter/half_target_filter.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/product.dart';
import 'package:style_hub/setUp/size/app_size.dart';

import '../bloc/prdoct_filter/product_filter_bloc.dart';
import '../bloc/scroll/scroll_bloc.dart';
import '../widgets/filter/half_condition_filter.dart';
import '../widgets/filter/half_location_filter.dart';
import '../widgets/filter/half_material_filter.dart';
import '../widgets/filter/half_price_filter.dart';
import '../widgets/filter/half_size_filter.dart';
import '../widgets/search.dart';
import 'filter/condition.dart';
import 'filter/material.dart';
import 'filter/price.dart';
import 'filter/size.dart';
import 'filter/target.dart';

const image =
    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

enum Filters {
  color,
  material,
  size,
  brand,
  price,
  condition,
  target,
  location,
  sort
}

class ProductList extends StatefulWidget {
  const ProductList({super.key});

  @override
  State<ProductList> createState() => _ProductListState();
}

class _ProductListState extends State<ProductList> {
  @override
  void initState() {
    super.initState();
    context.read<ProductFilterBloc>().add(ClearAllEvent());
    _scrollController.addListener(_scrollListener);
  }

  final ScrollController _scrollController = ScrollController();
  Timer? _scrollEndTimer;
  final TextEditingController searchController = TextEditingController();

  void _scrollListener() {
    if (_scrollEndTimer != null && _scrollEndTimer!.isActive) {
      _scrollEndTimer!.cancel();
    }

    if (_scrollController.position.userScrollDirection ==
        ScrollDirection.reverse) {
      context.read<ScrollBloc>().add(ToggleVisibilityEvent(isVisible: false));
    } else if (_scrollController.position.userScrollDirection ==
        ScrollDirection.forward) {
      context.read<ScrollBloc>().add(ToggleVisibilityEvent(isVisible: true));
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  bool isExpanded = false;

  void onfilterPrice() {}

  void onfilterMaterial() {}

  void onfilterSize() {}

  void onfilterBrand() {}

  void onfilterColor() {}

  void onfilterCondition() {}

  void onfilterLocation() {}

  void onfilterTarget() {}

  void onSort() {}

  void displayBottomSheet(BuildContext context, Filters filterType) {
    showModalBottomSheet<void>(
      isScrollControlled: true,
      backgroundColor: Theme.of(context).colorScheme.onPrimary,
      useRootNavigator: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(AppSize.xxxSmallSize),
          topRight: Radius.circular(AppSize.xxxSmallSize),
        ),
      ),
      context: context,
      builder: (BuildContext context) {
        return GestureDetector(
            onVerticalDragUpdate: (details) async {
              if (details.delta.dy < -5) {
                final data = await Navigator.push(
                  context,
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        filterType == Filters.color
                            ? ColorFullFilterScreen(
                                isAdd: false, onTap: onfilterColor)
                            : filterType == Filters.material
                                ? MaterialFullFilterScreen(
                                    isAdd: false, onTap: onfilterMaterial)
                                : filterType == Filters.size
                                    ? SizeFullFilterScreen(
                                        isAdd: false, onTap: onfilterSize)
                                    : filterType == Filters.price
                                        ? PriceFullFilterScreen(
                                            isAdd: false, onTap: onfilterPrice)
                                        : filterType == Filters.target
                                            ? TargetFullFilterScreen(
                                                isAdd: false,
                                                onTap: onfilterTarget)
                                            : filterType == Filters.condition
                                                ? ConditionFullFilterScreen(
                                                    isAdd: false,
                                                    onTap: onfilterCondition)
                                                : filterType == Filters.location
                                                    ? LocationFullFilterScreen(
                                                        isAdd: false,
                                                        onTap: onfilterLocation)
                                                    : filterType ==
                                                            Filters.brand
                                                        ? BrandFullFilterScreen(
                                                            isAdd: false,
                                                            onTap:
                                                                onfilterBrand)
                                                        : filterType ==
                                                                Filters.sort
                                                            ? SortByFullFilterScreen(
                                                                isAdd: false,
                                                                onTap: onSort)
                                                            : const SizedBox(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) {
                      const begin = Offset(0.0, 1.0);
                      const end = Offset.zero;
                      const curve = Curves.ease;
                      var tween = Tween(begin: begin, end: end)
                          .chain(CurveTween(curve: curve));
                      var offsetAnimation = animation.drive(tween);

                      return SlideTransition(
                        position: offsetAnimation,
                        child: child,
                      );
                    },
                    transitionDuration: const Duration(milliseconds: 300),
                  ),
                );
                if (data != null && data == true) {
                  Navigator.pop(context);
                }
              }
              if (details.delta.dy > 5) {
                Navigator.pop(context);
              }
            },
            child: filterType == Filters.color
                ? HalfColorFilterDisplay(isAdd: false, onTap: onfilterColor)
                : filterType == Filters.material
                    ? HalfMaterialFilterDisplay(
                        isAdd: false, onTap: onfilterMaterial)
                    : filterType == Filters.size
                        ? HalfSizeFilterDisplay(
                            isAdd: false, onTap: onfilterSize)
                        : filterType == Filters.brand
                            ? HalfBrandFilterDisplay(
                                isAdd: false, onTap: onfilterBrand)
                            : filterType == Filters.price
                                ? HalfPriceFilterDisplay(
                                    isAdd: false, onTap: onfilterPrice)
                                : filterType == Filters.condition
                                    ? HalfConditionFilterDisplay(
                                        isAdd: false, onTap: onfilterCondition)
                                    : filterType == Filters.target
                                        ? HalfTargetFilterDisplay(
                                            isAdd: false, onTap: onfilterTarget)
                                        : filterType == Filters.location
                                            ? HalfLocationFilterDisplay(
                                                isAdd: false,
                                                onTap: onfilterLocation)
                                            : filterType == Filters.sort
                                                ? HalfSortFilterDisplay(
                                                    isAdd: false, onTap: onSort)
                                                : const SizedBox());
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    const List<String> categories = [
      "For you",
      "Trending",
      "New",
      "Popular",
      "Recommended",
    ];

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Padding(
          padding: const EdgeInsets.all(AppSize.smallSize),
          child: Column(
            children: [
              Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Icon(
                      Icons.arrow_back_outlined,
                      size: 32,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                  ),
                  const SizedBox(width: AppSize.smallSize),
                  Search(
                    title: "What are you looking for?",
                    controller: searchController,
                  ),
                  const SizedBox(width: AppSize.smallSize),
                  Icon(
                    Icons.notifications_none_outlined,
                    size: 32,
                    color: Theme.of(context).colorScheme.onSurface,
                  ),
                ],
              ),
              const SizedBox(height: AppSize.smallSize),
              Expanded(
                child: CustomScrollView(
                  controller: _scrollController,
                  slivers: [
                    SliverToBoxAdapter(
                      child: Wrap(
                        spacing: AppSize.mediumSize,
                        runSpacing: AppSize.smallSize,
                        children: [
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.brand),
                            child: Text(
                              "Brand",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.color),
                            child: Text(
                              "Color",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.condition),
                            child: Text(
                              "Condition",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.location),
                            child: Text(
                              "Location",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.material),
                            child: Text(
                              "Material",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.price),
                            child: Text(
                              "Price",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.size),
                            child: Text(
                              "Size",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.sort),
                            child: Text(
                              "Sort",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () =>
                                displayBottomSheet(context, Filters.target),
                            child: Text(
                              "Target",
                              style: Theme.of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SliverToBoxAdapter(
                      child: SizedBox(height: AppSize.smallSize),
                    ),
                    SliverAppBar(
                      pinned: true,
                      automaticallyImplyLeading: false,
                      forceMaterialTransparency: true,
                      backgroundColor: Theme.of(context).colorScheme.onPrimary,
                      toolbarHeight: 55,
                      flexibleSpace: Container(
                        color: Theme.of(context).colorScheme.onPrimary,
                        child: ListView.builder(
                          padding:
                              const EdgeInsets.only(bottom: AppSize.smallSize),
                          scrollDirection: Axis.horizontal,
                          itemCount: categories.length,
                          itemBuilder: (context, index) {
                            return ChipButton(
                              text: categories[index],
                              onTap: () {},
                              isActive: index == 0,
                            );
                          },
                        ),
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: Wrap(
                        spacing: AppSize.smallSize,
                        runSpacing: AppSize.smallSize,
                        children: List.generate(45, (index) => const Product()),
                      ),
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
