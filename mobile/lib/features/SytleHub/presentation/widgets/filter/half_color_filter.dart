import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/captilizations.dart';
import 'package:style_hub/features/SytleHub/presentation/bloc/prdoct_filter/product_filter_bloc.dart';

import '../../../../../setUp/size/app_size.dart';
import '../../bloc/product/product_bloc.dart';
import '../shimmer/filter.dart';
import 'bottom_filter_bar.dart';

class HalfColorFilterDisplay extends StatelessWidget {
  const HalfColorFilterDisplay(
      {super.key, required this.isAdd, required this.onTap});

  final bool isAdd;
  final Function() onTap;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(AppSize.smallSize),
            child: Column(
              children: <Widget>[
                Container(
                  height: 8,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.onSurface,
                    borderRadius: BorderRadius.circular(AppSize.xxSmallSize),
                  ),
                ),
                if (context.watch<ProductBloc>().state.colorStatus ==
                    ColorStatus.loading)
                  const SizedBox(height: AppSize.largeSize),
                if (context.watch<ProductBloc>().state.colorStatus ==
                    ColorStatus.loading)
                  for (int index = 0; index < 6; index++)
                    Container(
                        margin:
                            const EdgeInsets.only(bottom: AppSize.smallSize),
                        child: const FilterShimmer()),
                if (context.watch<ProductBloc>().state.colorStatus ==
                    ColorStatus.loading)
                  const LinearProgressIndicator(),
                if (context.watch<ProductBloc>().state.colorStatus ==
                    ColorStatus.success)
                  for (int index = 0;
                      index <
                          min(
                            6,
                            context.watch<ProductBloc>().state.colors.length,
                          );
                      index++)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: AppSize.smallSize),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            decoration: BoxDecoration(
                              color: Color(int.parse(
                                "FF${context.watch<ProductBloc>().state.colors[index].hexCode.substring(1)}",
                                radix: 16,
                              )),
                              borderRadius:
                                  BorderRadius.circular(AppSize.xxSmallSize),
                            ),
                          ),
                          const SizedBox(width: AppSize.smallSize),
                          Text(
                            Captilizations.capitalize(context
                                .watch<ProductBloc>()
                                .state
                                .colors[index]
                                .name),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                ),
                          ),
                          const Spacer(),
                          Checkbox(
                            value: context
                                .watch<ProductFilterBloc>()
                                .state
                                .selectedColors
                                .contains(
                                  context
                                      .watch<ProductBloc>()
                                      .state
                                      .colors[index]
                                      .id,
                                ),
                            onChanged: (value) {
                              if (value != null) {
                                final colorId = context
                                    .read<ProductBloc>()
                                    .state
                                    .colors[index]
                                    .id;
                                if (context
                                    .read<ProductFilterBloc>()
                                    .state
                                    .selectedColors
                                    .contains(colorId)) {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(RemoveSelectedColorEvent(colorId));
                                } else {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(AddSelectedColorEvent(colorId));
                                }
                              }
                            },
                          ),
                        ],
                      ),
                    ),
              ],
            ),
          ),
          if (context.watch<ProductBloc>().state.brandStatus ==
              BrandStatus.loading)
            const LinearProgressIndicator(),
          Container(
            padding: const EdgeInsets.all(AppSize.smallSize),
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.1),
                  width: 0.5,
                ),
              ),
            ),
            child: BottomFilterBar(
                isAdd: isAdd,
                onTapClear: () {
                  context
                      .read<ProductFilterBloc>()
                      .add(ClearSelectedColorsEvent());
                },
                onTapResult: () {
                  onTap();
                  Navigator.pop(context, true);
                }),
          )
        ],
      ),
    );
  }
}
