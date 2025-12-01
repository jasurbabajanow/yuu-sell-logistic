import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class StepProgressBar extends StatelessWidget {
  final int currentStep;
  final int totalSteps;

  const StepProgressBar({
    super.key,
    required this.currentStep,
    this.totalSteps = 4,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Row(
      children: List.generate(
        totalSteps,
        (index) => Expanded(
          child: Container(
            height: 4 * ratio,
            margin: EdgeInsets.only(
              right: index < totalSteps - 1 ? 4 * ratio : 0,
            ),
            decoration: BoxDecoration(
              color: index < currentStep ? AppColors.main : Colors.grey.shade300,
              borderRadius: BorderRadius.circular(2 * ratio),
            ),
          ),
        ),
      ),
    );
  }
}
