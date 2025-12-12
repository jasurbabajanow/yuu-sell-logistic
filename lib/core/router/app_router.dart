import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/main_page.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/air_cargo_page.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/econom_page.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/express_page.dart';
import 'package:yuu_sell/presentation/screens/calculate/delivery_calculate_page.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/car_cargo_page.dart';
import 'package:yuu_sell/presentation/screens/home/home_page.dart';
import 'package:yuu_sell/presentation/screens/messages/messages_page.dart';
import 'package:yuu_sell/presentation/screens/profile/profile_page.dart';
import 'package:yuu_sell/presentation/screens/register/otp_page.dart';
import 'package:yuu_sell/presentation/screens/register/sign_up_page.dart';
import 'package:yuu_sell/presentation/screens/register/splash_screen.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/sea_cargo_page.dart';
import 'package:yuu_sell/presentation/screens/truck/truck_page.dart';

/// Route paths
class AppRoutes {
  // Auth routes
  static const String splash = '/splash';
  static const String signUp = '/sign-up';
  static const String login = '/login';
  static const String otp = '/otp';

  // Main shell routes
  static const String main = '/';
  static const String home = '/home';
  static const String messages = '/messages';
  static const String truck = '/truck';
  static const String profile = '/profile';

  // Nested routes (keep bottom nav visible)
  static const String deliveryCalculate = 'delivery-calculate';
  static const String airCargo = 'air-cargo';
  static const String carCargo = 'car-cargo';
  static const String seaCargo = 'sea-cargo';

  // Air cargo sub-routes
  static const String econom = 'econom';
  static const String express = 'express';
}

/// GoRouter configuration
final GoRouter appRouter = GoRouter(
  initialLocation: AppRoutes.splash,
  debugLogDiagnostics: true,
  routes: [
    // Splash screen (3 sec timer → Register)
    GoRoute(
      path: AppRoutes.splash,
      name: 'splash',
      builder: (context, state) => const SplashScreen(),
    ),

    // Auth routes
    GoRoute(
      path: AppRoutes.signUp,
      name: 'signUp',
      builder: (context, state) => const SignUpPage(signUp: true),
    ),
    GoRoute(
      path: AppRoutes.login,
      name: 'login',
      builder: (context, state) => const SignUpPage(signUp: false),
    ),
    GoRoute(
      path: AppRoutes.otp,
      name: 'otp',
      builder: (context, state) => const OtpPage(),
    ),

    // Main shell with bottom navigation
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainPageShell(navigationShell: navigationShell);
      },
      branches: [
        // Home tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              name: 'home',
              builder: (context, state) => const HomePage(),
              routes: [
                GoRoute(
                  path: AppRoutes.deliveryCalculate,
                  name: 'deliveryCalculate',
                  builder: (context, state) => const DeliveryCalculatePage(),
                ),
                GoRoute(
                  path: AppRoutes.airCargo,
                  name: 'airCargo',
                  builder: (context, state) => const AirCargoPage(),
                  routes: [
                    GoRoute(
                      path: AppRoutes.econom,
                      name: 'econom',
                      builder: (context, state) => const EconomPage(),
                    ),
                    GoRoute(
                      path: AppRoutes.express,
                      name: 'express',
                      builder: (context, state) => const ExpressPage(),
                    ),
                  ],
                ),

                GoRoute(
                  path: AppRoutes.carCargo,
                  name: 'carCargo',
                  builder: (context, state) => const CarCargoPage(),
                ),
                GoRoute(
                  path: AppRoutes.seaCargo,
                  name: 'seaCargo',
                  builder: (context, state) => const SeaCargoPage(),
                ),
              ],
            ),
          ],
        ),
        // Messages tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.messages,
              name: 'messages',
              builder: (context, state) => const MessagesPage(),
            ),
          ],
        ),
        // Truck tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.truck,
              name: 'truck',
              builder: (context, state) => const TruckPage(),
            ),
          ],
        ),
        // Profile tab
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              name: 'profile',
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
  errorBuilder: (context, state) =>
      Scaffold(body: Center(child: Text('Page not found: ${state.uri.path}'))),
);
