import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class ConstructionRow extends StatelessWidget {
  const ConstructionRow({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Row(
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
                  style: AppFontStyles.s12w600(ratio).copyWith(fontSize: 10),
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
                  style: AppFontStyles.s12w600(ratio).copyWith(fontSize: 10),
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
                  style: AppFontStyles.s12w600(ratio).copyWith(fontSize: 10),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
