import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      height: 45 * ratio,
      padding: EdgeInsets.symmetric(
        horizontal: 16 * ratio,
        vertical: 12 * ratio,
      ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(10 * ratio),
        boxShadow: [
          BoxShadow(
            color: Color(0xFF000000).withOpacity(0.08),
            spreadRadius: 0,
            blurRadius: 15,
            offset: const Offset(0, 4),
          ),
        ]
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              cursorHeight: 14 * ratio,
              decoration: InputDecoration(
                hintText: 'Search',
                border: InputBorder.none,
                isDense: true,
                hintStyle: AppFontStyles.s12w400(ratio).copyWith(fontSize: 14 * ratio),
              ),
            )
          ),
          SvgPicture.asset('assets/icons/search.svg')
        ],
      ),
    );
  }
}
