import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class RulesSheet extends StatelessWidget {
  const RulesSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      padding: EdgeInsets.only(
        left: 20 * ratio,
        right: 20 * ratio,
        top: 20 * ratio,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40 * ratio,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * ratio),
          topRight: Radius.circular(20 * ratio),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withValues(alpha: 0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/rules1.svg'),
                ),
                Expanded(
                  child: Text(
                    'Dimensional weight',
                    style: AppFontStyles.s14w600(ratio),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: Container(
                    height: 30 * ratio,
                    width: 80 * ratio,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(9 * ratio),
                    ),
                    child: Center(
                      child: Text(
                        'More detail',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withValues(alpha: 0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/rules2.svg'),
                ),
                Expanded(
                  child: Text(
                    'Customs declaration',
                    style: AppFontStyles.s14w600(ratio),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: Container(
                    height: 30 * ratio,
                    width: 80 * ratio,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(9 * ratio),
                    ),
                    child: Center(
                      child: Text(
                        'More detail',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withValues(alpha: 0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/rules3.svg'),
                ),
                Expanded(
                  child: Text(
                    'Prohibited items',
                    style: AppFontStyles.s14w600(ratio),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: Container(
                    height: 30 * ratio,
                    width: 80 * ratio,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(9 * ratio),
                    ),
                    child: Center(
                      child: Text(
                        'More detail',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withValues(alpha: 0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/rules4.svg'),
                ),
                Expanded(
                  child: Text(
                    'Deliver to us through fedex',
                    style: AppFontStyles.s14w600(ratio),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: Container(
                    height: 30 * ratio,
                    width: 80 * ratio,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(9 * ratio),
                    ),
                    child: Center(
                      child: Text(
                        'More detail',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withValues(alpha: 0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/rules5.svg'),
                ),
                Expanded(
                  child: Text(
                    'Compliance',
                    style: AppFontStyles.s14w600(ratio),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: Container(
                    height: 30 * ratio,
                    width: 80 * ratio,
                    decoration: BoxDecoration(
                      color: AppColors.main,
                      borderRadius: BorderRadius.circular(9 * ratio),
                    ),
                    child: Center(
                      child: Text(
                        'More detail',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
