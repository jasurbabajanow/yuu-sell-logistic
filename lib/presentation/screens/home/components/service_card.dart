import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imageUrl;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      width: 160 * ratio,
      margin: EdgeInsets.only(right: 12 * ratio),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12 * ratio),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image with badge
          Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(12 * ratio),
                  topRight: Radius.circular(12 * ratio),
                ),
                child: Image.network(
                  imageUrl,
                  width: 160 * ratio,
                  height: 100 * ratio,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 160 * ratio,
                    height: 100 * ratio,
                    color: Colors.grey.shade200,
                    child: const Center(child: Icon(Icons.image)),
                  ),
                ),
              ),
              Positioned(
                left: 8 * ratio,
                bottom: 8 * ratio,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 8 * ratio,
                    vertical: 4 * ratio,
                  ),
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(6 * ratio),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(
                        Icons.check_circle,
                        color: Colors.white,
                        size: 14 * ratio,
                      ),
                      SizedBox(width: 4 * ratio),
                      Text(
                        'YuuSell',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 11 * ratio,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          // Content
          Container(
            padding: EdgeInsets.all(12 * ratio),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(12 * ratio),
                bottomRight: Radius.circular(12 * ratio),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 16 * ratio,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 4 * ratio),
                Text(
                  description,
                  style: TextStyle(
                    fontSize: 12 * ratio,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey.shade600,
                    height: 1.3,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
