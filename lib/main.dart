import 'package:clean_arch_app/core/services/service_locator.dart';
import 'package:flutter/material.dart';

import 'movies/presentation/view/movie_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ServiceLocator().init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: MovieScreen()
    );
  }
}