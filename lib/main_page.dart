import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/home/home_page.dart';
import 'package:yuu_sell/presentation/screens/messages/messages_page.dart';
import 'package:yuu_sell/presentation/screens/profile/profile_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: [
        const HomePage(),
        const MessagesPage(),
        const Center(child: Text('Truck Page')),
        const ProfilePage(),
      ][selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
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
