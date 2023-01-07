import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:store_app_th/store_cubit/store_cubit.dart';
import 'package:store_app_th/widgets/products_widget.dart';

import 'bloc_observer/bloc_observer.dart';

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const Home());

}

class Home extends StatelessWidget {
  const Home({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => StoreCubit()..getProducts(),
      child: const MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:ThemeData(
        appBarTheme: const AppBarTheme(
          color: Colors.orange,
        ),
      ),
      home:  Products(),
    );
  }
}
