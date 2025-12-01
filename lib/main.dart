import 'package:flutter/material.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
      ),
      home: MainPage(),
    );
  }
}
