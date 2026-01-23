import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuu_sell/core/di/injection_container.dart';
import 'package:yuu_sell/core/router/app_router.dart';
import 'package:yuu_sell/core/storage/token_storage.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialize token storage
  await TokenStorage.init();

  // Load saved token into DioClient
  InjectionContainer.dioClient.loadTokenFromStorage();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: InjectionContainer.providers,
      child: MaterialApp.router(
        title: 'Yuu Sell',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: AppColors.main),
        ),
        routerConfig: appRouter,
      ),
    );
  }
}
