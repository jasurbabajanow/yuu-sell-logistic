import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/discounts_tabbar_view.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/news_tabbar_view.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/shopping_tabbar_view.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/fcl_shipping_page.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/lcl_shipping_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_tab_bar.dart';

class SeaCargoPage extends StatefulWidget {
  const SeaCargoPage({super.key});

  @override
  State<SeaCargoPage> createState() => _SeaCargoPageState();
}

class _SeaCargoPageState extends State<SeaCargoPage>
    with TickerProviderStateMixin {
  int selectedTabIndex = 0;
  final List<String> tabs = ['News', 'Discounts', 'Shopping'];
  late final TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this)
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }
  
  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
                            builder: (context) => const LCLPage(),
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
                            Text(
                              "LCL Shipping",
                              style: AppFontStyles.s16w600(ratio),
                            ),
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
                            builder: (context) => const FCLPage(),
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
                              "FCL Shipping",
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
              CustomTabBar(tabController: _tabController, tabs: tabs),
              SizedBox(height: 16 * ratio),

              // Discount Cards List
              SizedBox(
                height: 600 * ratio, // Adjust height as needed
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    // News Tab
                    NewsTabbarView(),
                    // Discounts Tab
                    DiscountsTabbarView(),
                    // Shopping Tab
                    ShoppingTabbarView(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
