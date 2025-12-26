import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class MostHaveDocumentsSheetWidget extends StatelessWidget {
  const MostHaveDocumentsSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text("Most have documents", style: AppFontStyles.s16w500(ratio)),
          SizedBox(height: 16 * ratio),
          _buildAddingWidget(context, "Bill of sales"),
          SizedBox(height: 16 * ratio),
          _buildAddingWidget(context, "Pay receipts"),
          SizedBox(height: 16 * ratio),
          _buildAddingWidget(context, "Passport ID"),
          SizedBox(height: 16 * ratio),
          _buildAddingWidget(context, "Attorney (doverennost)"),
        ],
      ),
    );
  }

  Widget _buildAddingWidget(BuildContext context, String title) {
    final ratio = AppSizes.ratio(context);
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: AppFontStyles.s14w500(
              ratio,
            ).copyWith(color: AppColors.formDataLabel),
          ),
          SizedBox(height: 8 * ratio),
          Container(
            height: 80 * ratio,
            width: 80 * ratio,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(8 * ratio),
            ),
            child: Center(
              child: Icon(
                Icons.add,
                color: Colors.grey.shade400,
                size: 24 * ratio,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
