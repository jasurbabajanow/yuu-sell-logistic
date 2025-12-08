import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

/// Shell widget for bottom navigation with go_router
class MainPageShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPageShell({
    super.key,
    required this.navigationShell,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: navigationShell.currentIndex,
        onTap: (index) {
          navigationShell.goBranch(
            index,
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.main,
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),
        unselectedLabelStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/home.svg'),
            activeIcon: SvgPicture.asset('assets/icons/home_outlined.svg'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/message.svg'),
            activeIcon: SvgPicture.asset('assets/icons/message_outlined.svg'),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/truck.svg'),
            activeIcon: SvgPicture.asset('assets/icons/truck_outlined.svg'),
            label: 'Truck',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset('assets/icons/profile.svg'),
            activeIcon: SvgPicture.asset('assets/icons/profile_outlined.svg'),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
