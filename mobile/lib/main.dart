import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:style_hub/features/SytleHub/presentation/pages/layout.dart';
import 'package:style_hub/setUp/theme/ligth_theme.dart';
import 'package:style_hub/simple_bloc_observer.dart';

import 'features/SytleHub/presentation/bloc/prdoct_filter/product_filter_bloc.dart';
import 'features/SytleHub/presentation/bloc/product/product_bloc.dart';
import 'features/SytleHub/presentation/bloc/scroll/scroll_bloc.dart';
import 'injection_container.dart' as di;

void main() {
  Bloc.observer = const SimpleBlocObserver();
  di.init();
  runApp(const Starter());
}

class Starter extends StatelessWidget {
  const Starter({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ScrollBloc(),
        ),
        BlocProvider(create: (context) => ProductFilterBloc()),
        BlocProvider(create: (context) => di.sl<ProductBloc>()),
      ],
      child: MaterialApp(
        title: "Style Hub",
        debugShowCheckedModeBanner: false,
        theme: LigthTheme.theme,
        home: const Layout(),
      ),
    );
  }
}
