import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class ServiceCard extends StatelessWidget {
  final String title;
  final String description;
  final String imagePath;
  final Function()? onTap;

  const ServiceCard({
    super.key,
    required this.title,
    required this.description,
    required this.imagePath,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: 170 * ratio,
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
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12 * ratio),
                topRight: Radius.circular(12 * ratio),
              ),
              child: SvgPicture.asset(
                imagePath,
                width: 170 * ratio,
                height: 136 * ratio,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 170 * ratio,
                  height: 136 * ratio,
                  color: Colors.grey.shade200,
                  child: const Center(child: Icon(Icons.image)),
                ),
              ),
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
                  Text(title, style: AppFontStyles.s14w700(ratio)),
                  SizedBox(height: 4 * ratio),
                  Text(
                    description,
                    style: AppFontStyles.s8w500(
                      ratio,
                    ).copyWith(height: 1.3, color: AppColors.textFieldTitle),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
