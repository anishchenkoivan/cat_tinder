import 'package:cat_tinder/core/di/service_locator.dart';
import 'package:cat_tinder/presentation/bloc/like_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'presentation/screens/home_screen.dart';

void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
      ),
      home: BlocProvider(
        create: (_) => getIt<LikeBloc>(),
        child: const HomeScreen(title: 'Cats'),
      ),
    );
  }
}
