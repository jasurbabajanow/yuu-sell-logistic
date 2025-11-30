import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class CustomButton extends StatelessWidget {
  final bool isFilled;
  final Function()? onTap;
  const CustomButton({super.key, required this.onTap, this.isFilled = true});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: onTap,
      child: isFilled
          ? Container(
              decoration: BoxDecoration(
                color: AppColors.main,
                borderRadius: BorderRadius.circular(10 * ratio),
              ),
              height: 46 * ratio,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Sign up',
                  style: AppFontStyles.s16w600(
                    ratio,
                  ).copyWith(color: AppColors.white),
                ),
              ),
            )
          : Container(
              decoration: BoxDecoration(
                color: Colors.transparent,
                borderRadius: BorderRadius.circular(10 * ratio),
                border: Border.all(color: AppColors.main),
              ),
              height: 46 * ratio,
              width: double.infinity,
              child: Center(
                child: Text(
                  'Log in',
                  style: AppFontStyles.s16w600(ratio).copyWith(
                    color: isFilled ? AppColors.white : AppColors.main,
                  ),
                ),
              ),
            ),
    );
  }
}
