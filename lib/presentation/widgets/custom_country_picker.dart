import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class CustomCountryPicker extends StatelessWidget {
  final String flagEmoji;
  final String countryName;
  final VoidCallback? onTap;

  const CustomCountryPicker({
    super.key,
    required this.flagEmoji,
    required this.countryName,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 40 * ratio,
        padding: EdgeInsets.symmetric(
          horizontal: 8 * ratio,
          vertical: 8 * ratio,
        ),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(
            12 * ratio,
          ), // Pill shape (height/2)
          border: Border.all(color: Colors.black, width: 0.4),
        ),
        child: Row(
          children: [
            Text(flagEmoji, style: AppFontStyles.s18w600(ratio)),
            SizedBox(width: 8 * ratio),
            Expanded(
              child: Text(
                countryName,
                style: AppFontStyles.s14w400(
                  ratio,
                ).copyWith(color: Color(0xff868686)),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            Icon(
              Icons.keyboard_arrow_down_rounded,
              size: 26 * ratio,
              color: Color(0xff868686),
            ),
          ],
        ),
      ),
    );
  }
}
