import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/components/construction_row.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/discounts_tabbar_view.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/news_tabbar_view.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/shopping_tabbar_view.dart';
import 'package:yuu_sell/presentation/widgets/custom_tab_bar.dart';
import 'package:yuu_sell/presentation/widgets/delivery_type_box.dart';

class CarCargoPage extends StatefulWidget {
  const CarCargoPage({super.key});

  @override
  State<CarCargoPage> createState() => _CarCargoPageState();
}

class _CarCargoPageState extends State<CarCargoPage>
    with TickerProviderStateMixin {
  String? selectedCategory;
  String? selectedPickup;
  String? selectedConsignee;
  String? selectedCarInfo;
  String? selectedDocuments;
  String? selectedPickupDate;
  String? selectedToDate;
  int insuranceValue = 10;

  late final TabController _tabController;
  final List<String> tabs = ['News', 'Discounts', 'Shopping'];
  final List<String> mockLogos = [
    'assets/icons/ali_express.svg',
    'assets/icons/amazon.svg',
    'assets/icons/eBay_logo.svg',
    'assets/icons/ozon_logo.svg',
    'assets/icons/shopify_logo.svg',
  ];

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
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Car cargo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0 * ratio,
            right: 20.0 * ratio,
            bottom: 20 * ratio,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Image.asset('assets/images/banner.png'),
              SizedBox(height: 15 * ratio),

              Row(
                children: [
                  Expanded(
                    child: DeliveryTypeBox(
                      title: 'Auction',
                      imagePath: 'assets/icons/auction.svg',
                      goRoute: 'auction',
                    ),
                  ),
                  Expanded(
                    child: DeliveryTypeBox(
                      title: 'Personal',
                      imagePath: 'assets/icons/auto_cargo_personal.svg',
                      goRoute: 'personal',
                    ),
                  ),
                ],
              ),
              SizedBox(height: 12 * ratio),
              ConstructionRow(),

              CustomTabBar(tabController: _tabController, tabs: tabs),

              SizedBox(height: 16 * ratio),
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
