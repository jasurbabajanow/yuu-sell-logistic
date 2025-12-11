// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/components/construction_row.dart';
import 'package:yuu_sell/presentation/screens/home/components/discount_card.dart';
import 'package:yuu_sell/presentation/widgets/custom_tab_bar.dart';
import 'package:yuu_sell/presentation/widgets/delivery_type_box.dart';

class AirCargoPage extends StatefulWidget {
  const AirCargoPage({super.key});

  @override
  State<AirCargoPage> createState() => _AirCargoPageState();
}

class _AirCargoPageState extends State<AirCargoPage>
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
          'Air cargo',
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
                    child: DeliveryTypeBox(
                      title: 'Econom',
                      imagePath: 'assets/icons/econom_box.svg',
                      goRoute: 'econom',
                    ),
                  ),

                  SizedBox(width: 8 * ratio),
                  Expanded(
                    child: DeliveryTypeBox(
                      title: 'Express',
                      imagePath: 'assets/icons/express_box.svg',
                      goRoute: 'express',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12 * ratio),

              // Constructions here
              ConstructionRow(),
              SizedBox(height: 12 * ratio),

              // Tab Bar here with 3 tabs
              CustomTabBar(tabController: _tabController, tabs: tabs),
              SizedBox(height: 16 * ratio),
              for (int i = 0; i < 5; i++)
                DiscountCard(
                  title: 'Autumn Surprise: XBOX Giveaway',
                  description:
                      'Winner revealed Oct 1, 2025 - follow us on social media to stay tuned.',
                  date: '18.08.2025',
                  imageUrl: 'https://picsum.photos/100/100?random=${20 + i}',
                ),
            ],
          ),
        ),
      ),
    );
  }
}
