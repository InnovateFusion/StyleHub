import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';
import 'package:style_hub/features/SytleHub/presentation/bloc/scroll/scroll_bloc.dart';
import 'package:style_hub/features/SytleHub/presentation/pages/product_list.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/search.dart';

import '../../../../setUp/size/app_size.dart';
import '../widgets/category_chip.dart';
import '../widgets/category_swap_chip.dart';
import '../widgets/sub_category_list.dart';

const image =
    "https://images.unsplash.com/photo-1539571696357-5a69c17a67c6?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  void initState() {
    super.initState();

    _scrollController.addListener(_scrollListener);
  }

  final ScrollController _scrollController = ScrollController();
  Timer? _scrollEndTimer;

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

  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    _scrollController.removeListener(_scrollListener);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const List<String> categories = [
      "All",
      "Men",
      "Women",
      "Kids",
      "Shoes",
      "Accessories",
    ];

    void gotoProductList() {
      PersistentNavBarNavigator.pushNewScreenWithRouteSettings(
        context,
        settings: const RouteSettings(name: '/contest/standing'),
        screen: const ProductList(),
        withNavBar: true,
        pageTransitionAnimation: PageTransitionAnimation.fade,
      );
    }

    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(AppSize.smallSize),
              child: Row(
                children: [
                  const CircleAvatar(
                    backgroundImage: NetworkImage(image),
                    radius: 22.5,
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
            ),
            Container(
              height: 35,
              padding: const EdgeInsets.only(
                  left: AppSize.smallSize, right: AppSize.smallSize),
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
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(right: AppSize.mediumSize),
                    child: CategorySwapChip(
                      text: categories[index],
                      onTap: () {},
                      isActive: index == 0,
                    ),
                  );
                },
              ),
            ),
            Expanded(
              child: ListView.builder(
                padding: const EdgeInsets.all(AppSize.smallSize),
                controller: _scrollController,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return SubCategoryList(
                    title: "New Brand",
                    subCategories: List.generate(8, (index) {
                      return CategoryChip(
                          name: "Women Coat",
                          image: image,
                          onTap: gotoProductList);
                    }),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
