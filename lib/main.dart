import 'package:flutter/material.dart';
import 'package:yuu_sell/core/router/app_router.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Yuu Sell',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
      ),
      routerConfig: appRouter,
    );
  }
}
