import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';

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
              width: 80 * ratio,
              height: 80 * ratio,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80 * ratio,
                height: 80 * ratio,
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
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15 * ratio,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4 * ratio),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 13 * ratio,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                SizedBox(height: 6 * ratio),
                Text(
                  date,
                  style: TextStyle(
                    fontSize: 12 * ratio,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
