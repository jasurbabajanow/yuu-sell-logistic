import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/home/components/discount_card.dart';
import 'package:yuu_sell/presentation/screens/home/components/search_bar_widget.dart';
import 'package:yuu_sell/presentation/screens/home/components/service_card.dart';
import 'package:yuu_sell/presentation/screens/home/components/tracking_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Discounts', 'Locations', 'Shopping'];
  final List<Map<String, String>> services = [
    {
      'title': 'AIR CARGO',
      'description':
          'We receive, label, pack, and ship your products directly to Amazon FBA warehouses. 100% compliant with Amazon’s requirements — no delays or returns.',
      'imagePath': 'assets/images/air_cargo_card.svg',
      'pageRoute': 'airCargo',
    },
    {
      'title': 'TRUCK CARGO',
      'description':
          'We receive, label, pack, and ship your products directly to Amazon FBA warehouses. 100% compliant with Amazon’s requirements — no delays or returns.',
      'imagePath': 'assets/images/air_cargo_card.svg',
      'pageRoute': 'carCargo',
    },
    {
      'title': 'SEA CARGO',
      'description':
          'We receive, label, pack, and ship your products directly to Amazon FBA warehouses. 100% compliant with Amazon’s requirements — no delays or returns.',
      'imagePath': 'assets/images/air_cargo_card.svg',
      'pageRoute': 'seaCargo',
    },
  ];

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: SizedBox(
        width: 60 * ratio,
        height: 60 * ratio,
        child: FloatingActionButton(
          backgroundColor: AppColors.main,
          shape: const CircleBorder(),
          onPressed: () {
            context.goNamed('deliveryCalculate');
          },
          child: SvgPicture.asset('assets/icons/calculator.svg'),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 20 * ratio),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 16 * ratio),
                // Search Bar
                const SearchBarWidget(),
                SizedBox(height: 20 * ratio),

                // Hero Banner
                Image.asset('assets/images/banner.png'),
                SizedBox(height: 24 * ratio),

                // Our services
                Text(
                  'Our services',
                  style: TextStyle(
                    fontSize: 18 * ratio,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 16 * ratio),
                SizedBox(
                  height: 206 * ratio,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      ServiceCard(
                        title: services[0]['title'] ?? '',
                        description: services[0]['description'] ?? '',
                        imagePath: services[0]['imagePath'] ?? '',
                        onTap: () {
                          context.goNamed(services[0]['pageRoute'] ?? 'push');
                        },
                      ),
                      ServiceCard(
                        title: services[1]['title'] ?? '',
                        description: services[1]['description'] ?? '',
                        imagePath: services[1]['imagePath'] ?? '',
                        onTap: () {
                          context.goNamed(services[1]['pageRoute'] ?? 'push');
                        },
                      ),
                      ServiceCard(
                        title: services[2]['title'] ?? '',
                        description: services[2]['description'] ?? '',
                        imagePath: services[2]['imagePath'] ?? '',
                        onTap: () {
                          context.goNamed(services[2]['pageRoute'] ?? 'push');
                        },
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24 * ratio),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          for (int i = 0; i < tabs.length; i++)
                            _buildTab(tabs[i], i, ratio),
                        ],
                      ),
                    ),

                    SizedBox(height: 16 * ratio),

                    for (int i = 0; i < 5; i++)
                      DiscountCard(
                        title: 'Autumn Surprise: XBOX Giveaway',
                        description:
                            'Winner revealed Oct 1, 2025 – follow us o...',
                        date: '18.08.2025',
                        imageUrl:
                            'https://picsum.photos/100/100?random=${20 + i}',
                      ),
                  ],
                ),
                SizedBox(height: 20 * ratio),

                // Another Banner
                Image.asset('assets/images/banner.png'),
                SizedBox(height: 24 * ratio),

                // Tracking Card
                const TrackingCard(),
                SizedBox(height: 24 * ratio),

                // How does it work
                Text(
                  'How does it work',
                  style: TextStyle(
                    fontSize: 18 * ratio,
                    fontWeight: FontWeight.bold,
                    color: AppColors.main,
                  ),
                ),
                SizedBox(height: 16 * ratio),
                Row(
                  children: [
                    Container(
                      width: 48 * ratio,
                      height: 48 * ratio,
                      decoration: BoxDecoration(
                        color: Colors.blue.shade50,
                        borderRadius: BorderRadius.circular(8 * ratio),
                      ),
                      child: SvgPicture.asset('assets/icons/calc.svg'),
                    ),
                    SizedBox(width: 16 * ratio),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Calculate',
                            style: TextStyle(
                              fontSize: 16 * ratio,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          SizedBox(height: 4 * ratio),
                          Text(
                            'Fill out a quick online form — easy and fast.',
                            style: TextStyle(
                              fontSize: 14 * ratio,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 100 * ratio),
              ],
            ),
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
        width: 120 * ratio,
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
        child: Center(
          child: Text(
            title,
            style: TextStyle(
              fontSize: 14 * ratio,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
              color: isSelected ? AppColors.main : Colors.grey.shade600,
            ),
          ),
        ),
      ),
    );
  }
}
