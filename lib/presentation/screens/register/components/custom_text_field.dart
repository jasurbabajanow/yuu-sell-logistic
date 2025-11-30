import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class CustomTextField extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscure;
  const CustomTextField({
    super.key,
    required this.title,
    required this.hintText,
    this.obscure = false,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: AppFontStyles.s16w500(
            ratio,
          ).copyWith(color: AppColors.textFieldTitle),
        ),
        SizedBox(height: 10 * ratio),
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.textFieldBorder),
            borderRadius: BorderRadius.circular(12 * ratio),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12 * ratio,
              vertical: 2 * ratio,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.white,
                hintText: hintText,
              ),
              obscureText: obscure,
            ),
          ),
        ),
      ],
    );
  }
}
