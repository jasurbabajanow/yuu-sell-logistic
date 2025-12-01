import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/screens/profile/about_us_page.dart';
import 'package:yuu_sell/presentation/screens/profile/general_settings_page.dart';
import 'package:yuu_sell/presentation/screens/profile/notifications_page.dart';
import 'package:yuu_sell/presentation/screens/profile/payment_method_page.dart';
import 'package:yuu_sell/presentation/screens/profile/privacy_policy_page.dart';
import 'package:yuu_sell/presentation/screens/profile/security_page.dart';
import 'package:yuu_sell/presentation/screens/profile/witgets/language_bottom_sheet.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  String selectedLanguage = 'English';

  void _showLanguageBottomSheet() {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => LanguageBottomSheet(
        selectedLanguage: selectedLanguage,
        onLanguageSelected: (language) {
          setState(() {
            selectedLanguage = language;
          });
        },
      ),
    );
  }

  Widget _buildMenuItem({
    required String iconPath,
    required String title,
    required double ratio,
    VoidCallback? onTap,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: EdgeInsets.only(bottom: 20 * ratio),
        child: Row(
          children: [
            SvgPicture.asset(
              iconPath,
              width: 24 * ratio,
            ),
            SizedBox(width: 17 * ratio),
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: Color(0xff355DEE),
      appBar: AppBar(
        leading: Icon(Icons.arrow_back_ios, color: Colors.white),
        centerTitle: true,
        backgroundColor: Color(0xff355DEE),
        title: Text(
          'Profile Page',
          style: TextStyle(
            fontSize: 26,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        elevation: 0,
      ),
      body: Stack(
        children: [
          Positioned(
            top: 50 * ratio,
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              decoration: BoxDecoration(
                color: Color(0xffE4E4E4),
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20 * ratio,
                      vertical: 5 * ratio,
                    ),
                    height: 76 * ratio,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30 * ratio),
                        topRight: Radius.circular(30 * ratio),
                      ),
                    ),
                    child: Row(
                      children: [
                        CircleAvatar(
                          radius: 30 * ratio,
                          backgroundImage: AssetImage(
                            'assets/images/Avatar.png',
                          ),
                        ),
                        SizedBox(width: 20 * ratio),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Aman Amanow',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '(+1) 123 1234 5678',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                            Text(
                              'ID: TKM12345',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 1),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20 * ratio,
                      vertical: 16 * ratio,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _buildMenuItem(
                          iconPath: 'assets/icons/settings.svg',
                          title: 'General settings',
                          ratio: ratio,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => GeneralSettingsPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/privacy.svg',
                          title: 'Privacy Policy',
                          ratio: ratio,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PrivacyPolicy(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/security.svg',
                          title: 'Security',
                          ratio: ratio,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => SecurityPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/payment.svg',
                          title: 'Payment method',
                          ratio: ratio,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => PaymentMethodPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/history.svg',
                          title: 'History',
                          ratio: ratio,
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/about.svg',
                          title: 'About',
                          ratio: ratio,
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => AboutPage(),
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10 * ratio),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 20 * ratio,
                      vertical: 16 * ratio,
                    ),
                    color: Colors.white,
                    child: Column(
                      children: [
                        _buildMenuItem(
                          iconPath: 'assets/icons/languages.svg',
                          title: 'Languages',
                          ratio: ratio,
                          onTap: _showLanguageBottomSheet,
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/notifications.svg',
                          title: 'Notifications',
                          ratio: ratio,
                          onTap: () {
                            
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => NotificationsPage(),
                              ),
                            );
                          },
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/partnership.svg',
                          title: 'Partnership',
                          ratio: ratio,
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/support.svg',
                          title: 'Support',
                          ratio: ratio,
                        ),
                        _buildMenuItem(
                          iconPath: 'assets/icons/logout.svg',
                          title: 'Logout',
                          ratio: ratio,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}