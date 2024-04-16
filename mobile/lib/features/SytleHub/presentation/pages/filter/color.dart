import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/SytleHub/presentation/widgets/search.dart';
import 'package:style_hub/setUp/size/app_size.dart';

import '../../../../../core/utils/captilizations.dart';
import '../../../domain/entities/color_entity.dart';
import '../../bloc/prdoct_filter/product_filter_bloc.dart';
import '../../bloc/product/product_bloc.dart';
import '../../widgets/filter/bottom_filter_bar.dart';

class ColorFullFilterScreen extends StatefulWidget {
  const ColorFullFilterScreen(
      {super.key, required this.isAdd, required this.onTap});
  final bool isAdd;
  final Function() onTap;

  @override
  _ColorScreenState createState() => _ColorScreenState();
}

class _ColorScreenState extends State<ColorFullFilterScreen> {
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
    List<ColorEntity> filterColor() {
      List<ColorEntity> colors = context.watch<ProductBloc>().state.colors;
      if (searchController.text.isEmpty) return colors;
      return colors
          .where((color) => color.name
              .toLowerCase()
              .contains(searchController.text.toLowerCase()))
          .toList();
    }

    List<ColorEntity> colors = filterColor();
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
              Expanded(
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
                            title: "Search color",
                            controller: searchController,
                          ),
                        ],
                      ),
                    ),
                    if (context.watch<ProductBloc>().state.colorStatus ==
                        ColorStatus.loading)
                      const Expanded(
                        child: Center(child: CircularProgressIndicator()),
                      ),
                    if (context.watch<ProductBloc>().state.colorStatus ==
                        ColorStatus.success)
                      Expanded(
                        child: ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          padding: const EdgeInsets.symmetric(
                            horizontal: AppSize.smallSize,
                          ),
                          itemBuilder: (context, index) {
                            return Container(
                              width: double.infinity,
                              margin:
                                  const EdgeInsets.only(top: AppSize.smallSize),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      color: Color(int.parse(
                                        "FF${colors[index].hexCode.substring(1)}",
                                        radix: 16,
                                      )),
                                      borderRadius: BorderRadius.circular(
                                          AppSize.xxSmallSize),
                                    ),
                                  ),
                                  const SizedBox(width: AppSize.smallSize),
                                  Text(
                                    Captilizations.capitalize(
                                        colors[index].name),
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
                                        .selectedColors
                                        .contains(
                                          colors[index].id,
                                        ),
                                    onChanged: (value) {
                                      if (value != null) {
                                        final colorId = colors[index].id;
                                        if (context
                                            .read<ProductFilterBloc>()
                                            .state
                                            .selectedColors
                                            .contains(colorId)) {
                                          context.read<ProductFilterBloc>().add(
                                              RemoveSelectedColorEvent(
                                                  colorId));
                                        } else {
                                          context.read<ProductFilterBloc>().add(
                                              AddSelectedColorEvent(colorId));
                                        }
                                      }
                                    },
                                  ),
                                ],
                              ),
                            );
                          },
                          itemCount: colors.length,
                        ),
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
                                .add(ClearSelectedColorsEvent());
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
