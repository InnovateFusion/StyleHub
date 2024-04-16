import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/core/utils/captilizations.dart';
import 'package:style_hub/features/SytleHub/presentation/bloc/prdoct_filter/product_filter_bloc.dart';

import '../../../../../setUp/size/app_size.dart';
import 'bottom_filter_bar.dart';

class HalfConditionFilterDisplay extends StatefulWidget {
  const HalfConditionFilterDisplay(
      {super.key, required this.isAdd, required this.onTap});

  final bool isAdd;
  final Function() onTap;
  @override
  State<HalfConditionFilterDisplay> createState() =>
      _HalfCategoryFilterDisplayState();
}

const List<String> conditions = ["New", "Used", "Fairy Used"];

class _HalfCategoryFilterDisplayState
    extends State<HalfConditionFilterDisplay> {
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
                for (int index = 0; index < conditions.length; index++)
                  Container(
                    width: double.infinity,
                    margin: const EdgeInsets.only(top: AppSize.smallSize),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(Captilizations.capitalize(conditions[index]),
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                )),
                        const Spacer(),
                        Radio<String>(
                          value: conditions[index],
                          groupValue: context
                              .watch<ProductFilterBloc>()
                              .state
                              .condition,
                          onChanged: (String? value) {
                            if (value != null) {
                              print(value);
                              context
                                  .read<ProductFilterBloc>()
                                  .add(SetConditionEvent(value));
                            }
                          },
                        ),
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
                context.read<ProductFilterBloc>().add(ClearConditionEvent());
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
