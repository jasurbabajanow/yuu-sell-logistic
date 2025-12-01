import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class HeroBanner extends StatelessWidget {
  const HeroBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      height: 140 * ratio,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
          colors: [AppColors.mainLight, AppColors.main],
        ),
        borderRadius: BorderRadius.circular(16 * ratio),
      ),
      child: Stack(
        children: [
          // Decorative circles
          Positioned(
            left: 20 * ratio,
            top: 20 * ratio,
            child: Container(
              width: 100 * ratio,
              height: 100 * ratio,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.white.withValues(alpha: 0.3),
                  width: 20 * ratio,
                ),
              ),
            ),
          ),
          // Images placeholder
          Positioned(
            left: 0,
            bottom: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(16 * ratio),
              ),
              child: Image.network(
                'https://picsum.photos/200/100?random=1',
                width: 200 * ratio,
                height: 80 * ratio,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 200 * ratio,
                  height: 80 * ratio,
                  color: Colors.white24,
                ),
              ),
            ),
          ),
          // Text content
          Positioned(
            right: 20 * ratio,
            top: 0,
            bottom: 0,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  '7/24 with you!',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14 * ratio,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                SizedBox(height: 4 * ratio),
                Text(
                  'YuuSell',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28 * ratio,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
          // Plane image
          Positioned(
            right: 10 * ratio,
            bottom: 10 * ratio,
            child: Image.network(
              'https://picsum.photos/80/60?random=2',
              width: 80 * ratio,
              height: 60 * ratio,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) => Container(
                width: 80 * ratio,
                height: 60 * ratio,
                color: Colors.white24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
