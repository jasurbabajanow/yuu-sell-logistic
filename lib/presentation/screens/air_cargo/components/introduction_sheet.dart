import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class IntroductionSheet extends StatelessWidget {
  const IntroductionSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      padding: EdgeInsets.only(
        left: 50 * ratio,
        right: 50 * ratio,
        top: 24 * ratio,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40 * ratio,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * ratio),
          topRight: Radius.circular(20 * ratio),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Introduction',
            style: AppFontStyles.s24w600(
              ratio,
            ).copyWith(fontSize: 20, color: AppColors.main),
          ),
          Text(
            "Step-by-step shipping process — clear, fast, and convenient Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text. Step-by-step shipping process — clear, fast, and convenient Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text. Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text.",
            style: AppFontStyles.s14w400(ratio),
          ),
        ],
      ),
    );
  }
}
