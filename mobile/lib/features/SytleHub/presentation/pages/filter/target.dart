import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/setUp/size/app_size.dart';

import '../../../../../core/utils/captilizations.dart';
import '../../bloc/prdoct_filter/product_filter_bloc.dart';
import '../../widgets/filter/bottom_filter_bar.dart';

const List<String> targets = ["Men", "Women", "Kids"];

class TargetFullFilterScreen extends StatefulWidget {
  const TargetFullFilterScreen(
      {super.key, required this.isAdd, required this.onTap});

  final bool isAdd;
  final Function() onTap;

  @override
  _TargetFullFilterScreenState createState() => _TargetFullFilterScreenState();
}

class _TargetFullFilterScreenState extends State<TargetFullFilterScreen> {
  bool _shouldPop = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).colorScheme.onPrimary,
        body: NotificationListener<ScrollNotification>(
          onNotification: (notification) {
            if (notification is ScrollUpdateNotification && !_shouldPop) {
              if (notification.metrics.pixels < -100) {
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
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      onTap: () => Navigator.pop(context, true),
                      child: Icon(
                        Icons.close_rounded,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                    Text("Target",
                        style: Theme.of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(
                              color: Theme.of(context).colorScheme.onSurface,
                            )),
                    const SizedBox(width: AppSize.largeSize),
                  ],
                ),
              ),
              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: AppSize.smallSize,
                      vertical: AppSize.smallSize,
                    ),
                    child: Column(
                      children: [
                        for (int index = 0; index < targets.length; index++)
                          Container(
                            width: double.infinity,
                            margin: const EdgeInsets.only(
                                bottom: AppSize.smallSize),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(Captilizations.capitalize(targets[index]),
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyLarge!
                                        .copyWith(
                                          color: Theme.of(context)
                                              .colorScheme
                                              .onSurface,
                                        )),
                                const Spacer(),
                                Radio<String>(
                                  value: targets[index],
                                  groupValue: context
                                      .watch<ProductFilterBloc>()
                                      .state
                                      .target,
                                  onChanged: (String? value) {
                                    if (value != null) {
                                      print(value);
                                      context
                                          .read<ProductFilterBloc>()
                                          .add(SetTargetEvent(value));
                                    }
                                  },
                                ),
                              ],
                            ),
                          ),
                        SizedBox(
                            height: MediaQuery.of(context).size.height * 0.575),
                      ],
                    ),
                  ),
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
                    context.read<ProductFilterBloc>().add(ClearTargetEvent());
                  },
                  onTapResult: () {
                    widget.onTap();
                    Navigator.pop(context, true);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
