import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/captilizations.dart';
import 'package:style_hub/features/SytleHub/presentation/bloc/prdoct_filter/product_filter_bloc.dart';

import '../../../../../setUp/size/app_size.dart';
import 'bottom_filter_bar.dart';

class HalfSortFilterDisplay extends StatefulWidget {
  const HalfSortFilterDisplay(
      {super.key, required this.isAdd, required this.onTap});

  final bool isAdd;
  final Function() onTap;
  @override
  State<HalfSortFilterDisplay> createState() => _HalfSortFilterDisplayState();
}

const List<String> sorts = [
  "Newest",
  "Oldest",
  "Price: Low to High",
  "Price: High to Low"
];

const List<String> _sorts = [
  "createdAt-desc",
  "createdAt-asc",
  "price-asc",
  "price-desc",
];

class _HalfSortFilterDisplayState extends State<HalfSortFilterDisplay> {
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
                for (int index = 0; index < sorts.length; index++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: AppSize.smallSize),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Captilizations.capitalize(sorts[index]),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                )),
                        const Spacer(),
                        Radio<String>(
                            value: _sorts[index],
                            groupValue:
                                "${context.watch<ProductFilterBloc>().state.sort}-${context.watch<ProductFilterBloc>().state.order}",
                            onChanged: (String? value) {
                              print(value);
                              if (value != null) {
                                if (index == 0) {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(SetSortByEvent("createdAt", "desc"));
                                } else if (index == 1) {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(SetSortByEvent("createdAt", "asc"));
                                } else if (index == 2) {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(SetSortByEvent("price", "asc"));
                                } else if (index == 3) {
                                  context
                                      .read<ProductFilterBloc>()
                                      .add(SetSortByEvent("price", "desc"));
                                }
                              }
                            }),
                      ],
                    ),
                  ),
              ],
            ),
          ),
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
              isAdd: widget.isAdd,
              onTapClear: () {
                context.read<ProductFilterBloc>().add(ClearSortOrderEvent());
              },
              onTapResult: () {
                widget.onTap();
                Navigator.pop(context, true);
              },
            ),
          )
        ],
      ),
    );
  }
}
