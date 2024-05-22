import 'package:flutter/material.dart';
import 'package:weatherapp/feature/presentation/homepage.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News App',
      home: HomePage(),
    );
  }
}
