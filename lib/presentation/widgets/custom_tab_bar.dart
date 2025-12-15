import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class CustomTabBar extends StatelessWidget {
  final TabController tabController;
  final List<String> tabs;
  const CustomTabBar({
    super.key,
    required this.tabController,
    required this.tabs,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return SizedBox(
      height: 36 * ratio,
      child: TabBar(
        controller: tabController,
        dividerColor: Colors.transparent,
        indicatorColor: AppColors.main,
        labelColor: AppColors.main,
        indicatorPadding: EdgeInsets.only(top: 10 * ratio),
        indicatorSize: TabBarIndicatorSize.tab,
        tabs: [
          Text(
            tabs[0],
            style: AppFontStyles.s14w700(
              ratio,
            ).copyWith(color: tabController.index == 0 ? AppColors.main : null),
          ),
          Text(
            tabs[1],
            style: AppFontStyles.s14w700(
              ratio,
            ).copyWith(color: tabController.index == 1 ? AppColors.main : null),
          ),
          Text(
            tabs[2],
            style: AppFontStyles.s14w700(
              ratio,
            ).copyWith(color: tabController.index == 2 ? AppColors.main : null),
          ),
        ],
      ),
    );
  }
}
