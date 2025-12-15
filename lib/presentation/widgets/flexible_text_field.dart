import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class FlexibleTextField extends StatelessWidget {
  final String hintText;
  final bool isPrefix;
  final bool isSuffix;
  final int height;
  const FlexibleTextField({
    super.key,
    required this.hintText,
    this.isPrefix = false,
    this.isSuffix = false,
    this.height = 36,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.textFieldBorder),
      ),
      height: height * ratio,
      width: double.infinity,
      child: Row(
        children: [
          isPrefix
              ? Padding(
                  padding: EdgeInsets.only(left: 10 * ratio),
                  child: Icon(
                    Icons.wallet_rounded,
                    color: AppColors.textFieldTitle,
                    size: 20 * ratio,
                  ),
                )
              : SizedBox(),
          SizedBox(width: 12 * ratio),
          Expanded(
            child: Text(
              hintText,
              style: AppFontStyles.s12w400(
                ratio,
              ).copyWith(color: AppColors.textFieldTitle),
            ),
          ),
          isSuffix
              ? Padding(
                  padding: EdgeInsets.only(right: 8 * ratio),
                  child: Icon(
                    Icons.keyboard_arrow_down,
                    color: AppColors.textFieldTitle,
                  ),
                )
              : SizedBox(),
        ],
      ),
    );
  }
}
