import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/SytleHub/presentation/bloc/prdoct_filter/product_filter_bloc.dart';

import '../../../../../core/utils/captilizations.dart';
import '../../../../../setUp/size/app_size.dart';
import '../../bloc/product/product_bloc.dart';
import '../shimmer/filter.dart';
import 'bottom_filter_bar.dart';

class HalfBrandFilterDisplay extends StatelessWidget {
  const HalfBrandFilterDisplay(
      {super.key, required this.isAdd, required this.onTap});

  final bool isAdd;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const SizedBox(height: AppSize.smallSize),
          Container(
            height: 8,
            width: 50,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.onSurface,
              borderRadius: BorderRadius.circular(AppSize.xxSmallSize),
            ),
          ),
          const SizedBox(height: AppSize.smallSize),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSize.smallSize),
            child: Column(
              children: <Widget>[
                if (context.watch<ProductBloc>().state.colorStatus ==
                    ColorStatus.loading)
                  const SizedBox(height: AppSize.smallSize),
                if (context.watch<ProductBloc>().state.brandStatus ==
                    BrandStatus.loading)
                  for (int index = 0; index < 6; index++)
                    Container(
                        margin:
                            const EdgeInsets.only(bottom: AppSize.smallSize),
                        child: const FilterShimmer()),
                if (context.watch<ProductBloc>().state.brandStatus ==
                    BrandStatus.success)
                  for (int index = 0;
                      index <
                          min(
                            6,
                            context.watch<ProductBloc>().state.brands.length,
                          );
                      index++)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(bottom: AppSize.smallSize),
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
                                fit: BoxFit.fill,
                              ),
                              borderRadius:
                                  BorderRadius.circular(AppSize.xxSmallSize),
                            ),
                          ),
                          const SizedBox(width: AppSize.smallSize),
                          Text(
                            Captilizations.capitalize(context
                                .watch<ProductBloc>()
                                .state
                                .brands[index]
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
                                .selectedBrands
                                .contains(
                                  context
                                      .watch<ProductBloc>()
                                      .state
                                      .brands[index]
                                      .id,
                                ),
                            onChanged: (value) {
                              if (value != null) {
                                final brandId = context
                                    .read<ProductBloc>()
                                    .state
                                    .brands[index]
                                    .id;
                                if (context
                                    .read<ProductFilterBloc>()
                                    .state
                                    .selectedBrands
                                    .contains(brandId)) {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(RemoveSelectedBrandEvent(brandId));
                                } else {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(AddSelectedBrandEvent(brandId));
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
                      .add(ClearSelectedBrandsEvent());
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
