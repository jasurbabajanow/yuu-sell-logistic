import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: AppColors.white..withValues(alpha: .10),
        boxShadow: [
          BoxShadow(
            color: Color(0x0F0D0A2C).withValues(alpha: .06),
            offset: Offset(0, 4),
            blurRadius: 12,
            spreadRadius: 0,
          ),
        ],
      ),
      height: 42 * ratio,
      width: 42 * ratio,
      child: BackButton(),
    );
  }
}
