import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/home/components/tracking_card.dart';

class TruckStatusSheet extends StatefulWidget {
  const TruckStatusSheet({super.key});

  @override
  State<TruckStatusSheet> createState() => _TruckStatusSheetState();
}

class _TruckStatusSheetState extends State<TruckStatusSheet>
    with TickerProviderStateMixin {
  late final TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    final height = MediaQuery.of(context).size.height * 0.5;

    return SizedBox(
      height: height,
      child: Container(
        padding: EdgeInsets.only(
          left: 20 * ratio,
          right: 20 * ratio,
          top: 20 * ratio,
          bottom: MediaQuery.of(context).viewInsets.bottom + 20 * ratio,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20 * ratio),
            topRight: Radius.circular(20 * ratio),
          ),
        ),

        child: Column(
          children: [
            Container(
              width: 40 * ratio,
              height: 4 * ratio,
              decoration: BoxDecoration(
                color: Colors.black26,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            SizedBox(height: 16 * ratio),

            /// TAB BAR
            TabBar(
              physics: ScrollPhysics(),
              labelStyle: AppFontStyles.s18w600(
                ratio,
              ).copyWith(fontWeight: FontWeight.w400),
              controller: _tabController,
              labelColor: AppColors.main,
              unselectedLabelColor: Colors.black,
              indicatorColor: AppColors.main,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorWeight: 3 * ratio,
              tabs: const [
                Tab(text: "In process"),
                Tab(text: "Delivered"),
              ],
            ),

            SizedBox(height: 12),

            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [_buildInProcessList(), _buildDeliveredList()],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInProcessList() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: 5,
      itemBuilder: (_, i) {
        return TrackingCard();
      },
    );
  }

  Widget _buildDeliveredList() {
    return ListView.builder(
      padding: EdgeInsets.only(top: 10),
      itemCount: 5,
      itemBuilder: (_, i) {
        return TrackingCard();
      },
    );
  }
}
