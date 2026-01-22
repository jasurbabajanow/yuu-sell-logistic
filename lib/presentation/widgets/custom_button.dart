import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class CustomButton extends StatelessWidget {
  final bool isFilled;
  final Function()? onTap;
  final String? text;
  final bool isLoading;

  const CustomButton({
    super.key,
    required this.onTap,
    this.isFilled = true,
    this.text,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);

    Widget content = isLoading
        ? SizedBox(
            height: 20 * ratio,
            width: 20 * ratio,
            child: CircularProgressIndicator(
              strokeWidth: 2,
              color: isFilled ? AppColors.white : AppColors.main,
            ),
          )
        : Text(
            text ?? (isFilled ? 'Sign up' : 'Log in'),
            style: AppFontStyles.s16w600(ratio).copyWith(
              color: isFilled ? AppColors.white : AppColors.main,
            ),
          );

    return GestureDetector(
      onTap: isLoading ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isFilled ? AppColors.main : Colors.transparent,
          borderRadius: BorderRadius.circular(10 * ratio),
          border: isFilled ? null : Border.all(color: AppColors.main),
        ),
        height: 46 * ratio,
        width: double.infinity,
        child: Center(child: content),
      ),
    );
  }
}
