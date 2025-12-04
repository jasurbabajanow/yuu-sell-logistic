import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/delivery_calculate_page.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/car_cargo_page.dart';
import 'package:yuu_sell/presentation/screens/home/components/discount_card.dart';
import 'package:yuu_sell/presentation/screens/home/components/search_bar_widget.dart';
import 'package:yuu_sell/presentation/screens/home/components/service_card.dart';
import 'package:yuu_sell/presentation/screens/home/components/tracking_card.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/air_cargo_page.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/sea_cargo_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTabIndex = 0;
  final List<String> tabs = ['Discounts', 'Locations', 'Shopping'];

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
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => DeliveryCalculatePage()),
            );
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
                  height: 200 * ratio,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const AirCargoPage(),
                            ),
                          );
                        },
                        child: ServiceCard(
                          title: 'AIR CARGO',
                          description:
                              'We receive, label, pack, and ship your packets directly to FBA ware...',
                          imageUrl: 'https://picsum.photos/200/120?random=10',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const CarCargoPage(),
                            ),
                          );
                        },
                        child: ServiceCard(
                          title: 'Truck CARGO',
                          description:
                              'We receive, label, pack, and ship your products to Amazon\'s FBA ware...',
                          imageUrl: 'https://picsum.photos/200/120?random=11',
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SeaCargoPage(),
                            ),
                          );
                        },
                        child: ServiceCard(
                          title: 'SEA CARGO',
                          description:
                              'We receive, label, pack, and ship your products to Amazon\'s FBA ware...',
                          imageUrl: 'https://picsum.photos/200/120?random=12',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 24 * ratio),

                // Tabs
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
                      child: Icon(
                        Icons.receipt_long_outlined,
                        color: AppColors.main,
                        size: 28 * ratio,
                      ),
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
