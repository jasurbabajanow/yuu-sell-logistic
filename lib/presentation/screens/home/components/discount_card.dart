import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class DiscountCard extends StatelessWidget {
  final String title;
  final String description;
  final String date;
  final String imageUrl;

  const DiscountCard({
    super.key,
    required this.title,
    required this.description,
    required this.date,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      margin: EdgeInsets.only(bottom: 12 * ratio),
      padding: EdgeInsets.all(12 * ratio),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * ratio),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          // Image
          ClipRRect(
            borderRadius: BorderRadius.circular(8 * ratio),
            child: Image.network(
              imageUrl,
              width: 92 * ratio,
              height: 75 * ratio,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 92 * ratio,
                height: 75 * ratio,
                color: Colors.grey.shade200,
                child: const Icon(Icons.image),
              ),
            ),
          ),
          SizedBox(width: 12 * ratio),
          // Content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppFontStyles.s14w600(ratio)),
                SizedBox(height: 4 * ratio),
                Text(
                  description,
                  style: AppFontStyles.s12w400(ratio),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6 * ratio),
                Text(date, style: AppFontStyles.s12w400(ratio)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
