import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/SytleHub/presentation/bloc/prdoct_filter/product_filter_bloc.dart';

import '../../../../../core/utils/captilizations.dart';
import '../../../../../setUp/size/app_size.dart';
import '../../bloc/product/product_bloc.dart';
import '../shimmer/filter.dart';
import 'bottom_filter_bar.dart';

class HalfLocationFilterDisplay extends StatelessWidget {
  const HalfLocationFilterDisplay(
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
                if (context.watch<ProductBloc>().state.locationStatus ==
                    LocationStatus.success)
                  for (int index = 0;
                      index <
                          min(
                            6,
                            context.watch<ProductBloc>().state.locations.length,
                          );
                      index++)
                    Container(
                      width: double.infinity,
                      margin: const EdgeInsets.only(top: AppSize.smallSize),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            Captilizations.capitalize(context
                                .watch<ProductBloc>()
                                .state
                                .locations[index]
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
                          Radio<String>(
                            value: context
                                .watch<ProductBloc>()
                                .state
                                .locations[index]
                                .id,
                            groupValue: context
                                .watch<ProductFilterBloc>()
                                .state
                                .location,
                            onChanged: (value) {
                              if (value != null) {
                                String location = context
                                    .read<ProductBloc>()
                                    .state
                                    .locations[index]
                                    .id;
                                double latitude = context
                                    .read<ProductBloc>()
                                    .state
                                    .locations[index]
                                    .latitude;
                                double longitude = context
                                    .read<ProductBloc>()
                                    .state
                                    .locations[index]
                                    .longitude;
                                context.read<ProductFilterBloc>().add(
                                    SetLocationEvent(
                                        location, latitude, longitude, 100));
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
                  context.read<ProductFilterBloc>().add(ClearLocationEvent());
                },
                onTapResult: () {
                  onTap();
                  Navigator.pop(context, true);
                }),
          ),
        ],
      ),
    );
  }
}
