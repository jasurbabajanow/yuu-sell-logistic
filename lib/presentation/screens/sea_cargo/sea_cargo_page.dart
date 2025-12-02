// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/home/components/discount_card.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/econom_page.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/express_page.dart';

class SeaCargoPage extends StatefulWidget {
  const SeaCargoPage({super.key});

  @override
  State<SeaCargoPage> createState() => _SeaCargoPageState();
}

class _SeaCargoPageState extends State<SeaCargoPage> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['News', 'Discounts', 'Shopping'];
  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20 * ratio,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Sea cargo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17 * ratio,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0 * ratio,
            vertical: 12 * ratio,
          ),
          child: Column(
            children: [
              Image.asset('assets/images/banner.png'),
              SizedBox(height: 12 * ratio),
              Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const EconomPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 110 * ratio,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20 * ratio),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withOpacity(0.05),
                              blurRadius: 14 * ratio,
                              offset: Offset(0, 9 * ratio),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/econom_box.svg',
                              width: 30 * ratio,
                              height: 30 * ratio,
                            ),
                            SizedBox(width: 15 * ratio),
                            Text("Econom", style: AppFontStyles.s16w600(ratio)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * ratio),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ExpressPage(),
                          ),
                        );
                      },
                      child: Container(
                        height: 110 * ratio,
                        decoration: BoxDecoration(
                          color: const Color(0xffffffff),
                          borderRadius: BorderRadius.circular(20 * ratio),
                          boxShadow: [
                            BoxShadow(
                              color: Color(0xff000000).withOpacity(0.05),
                              blurRadius: 14 * ratio,
                              offset: Offset(0, 9 * ratio),
                            ),
                          ],
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/icons/express_box.svg',
                              width: 30 * ratio,
                              height: 30 * ratio,
                            ),
                            SizedBox(width: 15 * ratio),
                            Text(
                              "Express",
                              style: AppFontStyles.s16w600(ratio),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12 * ratio),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 90 * ratio,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20 * ratio),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 14 * ratio,
                            offset: Offset(0, 9 * ratio),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/red_cancel.svg',
                            width: 20 * ratio,
                            height: 20 * ratio,
                          ),
                          SizedBox(height: 15 * ratio),
                          Text(
                            "Prohibited\nItems",
                            style: AppFontStyles.s12w600(
                              ratio,
                            ).copyWith(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * ratio),
                  Expanded(
                    child: Container(
                      height: 90 * ratio,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20 * ratio),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 14 * ratio,
                            offset: Offset(0, 9 * ratio),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/green_accept.svg',
                            width: 20 * ratio,
                            height: 20 * ratio,
                          ),
                          SizedBox(height: 15 * ratio),
                          Text(
                            "Rules",
                            style: AppFontStyles.s12w600(
                              ratio,
                            ).copyWith(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(width: 8 * ratio),
                  Expanded(
                    child: Container(
                      height: 90 * ratio,
                      decoration: BoxDecoration(
                        color: const Color(0xffffffff),
                        borderRadius: BorderRadius.circular(20 * ratio),
                        boxShadow: [
                          BoxShadow(
                            color: Color(0xff000000).withOpacity(0.05),
                            blurRadius: 14 * ratio,
                            offset: Offset(0, 9 * ratio),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/blue_info.svg',
                            width: 20 * ratio,
                            height: 20 * ratio,
                          ),
                          SizedBox(height: 15 * ratio),
                          Text(
                            "Introduction",
                            style: AppFontStyles.s12w600(
                              ratio,
                            ).copyWith(fontSize: 10),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12 * ratio),
              Row(
                children: tabs.asMap().entries.map((entry) {
                  final index = entry.key;
                  final tab = entry.value;
                  return _buildTab(tab, index, ratio);
                }).toList(),
              ),
              SizedBox(height: 16 * ratio),

              // Discount Cards List
              ...List.generate(
                5,
                (index) => DiscountCard(
                  title: 'Autumn Surprise: XBOX Giveaway',
                  description: 'Winner revealed Oct 1, 2025 – follow us o...',
                  date: '18.08.2025',
                  imageUrl:
                      'https://picsum.photos/100/100?random=${20 + index}',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTab(String title, int index, double ratio) {
    final isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * ratio,
          vertical: 8 * ratio,
        ),
        margin: EdgeInsets.only(right: 8 * ratio),
        decoration: BoxDecoration(
          color: isSelected ? Colors.transparent : Colors.transparent,
          border: isSelected
              ? Border(
                  bottom: BorderSide(color: AppColors.main, width: 2 * ratio),
                )
              : null,
        ),
        child: Text(
          title,
          style: TextStyle(
            fontSize: 14 * ratio,
            fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
            color: isSelected ? AppColors.main : Colors.grey.shade600,
          ),
        ),
      ),
    );
  }
}
