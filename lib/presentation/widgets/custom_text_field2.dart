import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class CustomTextField2 extends StatelessWidget {
  final String title;
  final String hintText;
  final bool obscure;
  final int maxLines;
  const CustomTextField2({
    super.key,
    required this.title,
    required this.hintText,
    this.obscure = false,
    this.maxLines = 1,
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
            border: Border.all(color: Color(0xff222222)),
            borderRadius: BorderRadius.circular(10 * ratio),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 12 * ratio,
              // vertical: 1 * ratio,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.white,
                hintText: hintText,
                hintMaxLines: maxLines,
              ),
              obscureText: obscure,
            ),
          ),
        ),
      ],
    );
  }
}
