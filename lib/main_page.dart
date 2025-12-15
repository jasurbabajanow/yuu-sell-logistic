import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

/// Shell widget for bottom navigation with go_router
class MainPageShell extends StatelessWidget {
  final StatefulNavigationShell navigationShell;

  const MainPageShell({super.key, required this.navigationShell});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: SizedBox(
        height: 90 * ratio,
        child: BottomNavigationBar(
          currentIndex: navigationShell.currentIndex,
          onTap: (index) {
            navigationShell.goBranch(
              index,
              initialLocation: index == navigationShell.currentIndex,
            );
          },
          backgroundColor: AppColors.white,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: AppColors.main,
          unselectedItemColor: Colors.grey,
          selectedLabelStyle: AppFontStyles.s12w600(ratio),
          unselectedLabelStyle: AppFontStyles.s12w400(ratio),
          items: [
            _buildNavBarItem(
              'assets/icons/home.svg',
              'assets/icons/home_outlined.svg',
              'Home',
            ),
            _buildNavBarItem(
              'assets/icons/message.svg',
              'assets/icons/message_outlined.svg',
              'Message',
            ),
            _buildNavBarItem(
              'assets/icons/truck.svg',
              'assets/icons/truck_outlined.svg',
              'Truck',
            ),
            _buildNavBarItem(
              'assets/icons/profile.svg',
              'assets/icons/profile_outlined.svg',
              'Profile',
            ),
          ],
        ),
      ),
    );
  }

  _buildNavBarItem(String icon, String activeIcon, String label) {
    return BottomNavigationBarItem(
      icon: SvgPicture.asset(icon),
      activeIcon: SvgPicture.asset(activeIcon),
      label: label,
    );
  }
}
