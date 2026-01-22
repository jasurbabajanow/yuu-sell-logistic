import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/components/introduction_sheet.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/components/prohibited_items_sheet.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/components/rules_sheet.dart';

class ConstructionRow extends StatelessWidget {
  const ConstructionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Row(
      children: [
        Expanded(
          child: GestureDetector(
            onTap: () => _showProhibitedItems(context),
            child: Container(
              height: 90 * ratio,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withValues(alpha: 0.05),
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
                    style: AppFontStyles.s12w600(ratio).copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8 * ratio),
        Expanded(
          child: GestureDetector(
            onTap: () => _showRules(context),
            child: Container(
              height: 90 * ratio,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withValues(alpha: 0.05),
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
                    style: AppFontStyles.s12w600(ratio).copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
        SizedBox(width: 8 * ratio),
        Expanded(
          child: GestureDetector(
            onTap: () => _showIntroduction(context),
            child: Container(
              height: 90 * ratio,
              decoration: BoxDecoration(
                color: const Color(0xffffffff),
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withValues(alpha: 0.05),
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
                    style: AppFontStyles.s12w600(ratio).copyWith(fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showProhibitedItems(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ProhibitedItemsSheet(),
    );
  }

  void _showRules(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const RulesSheet(),
    );
  }

  void _showIntroduction(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const IntroductionSheet(),
    );
  }
}
