import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class ForgotButtonWithIcon extends StatelessWidget {
  const ForgotButtonWithIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.info, color: AppColors.textButton, size: 16 * ratio),
          SizedBox(width: 2 * ratio),
          Text(
            'Forgot password',
            style: AppFontStyles.s12w400(
              ratio,
            ).copyWith(color: AppColors.textButton),
          ),
        ],
      ),
    );
  }
}
