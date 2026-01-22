import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class DeliveryTypeBox extends StatelessWidget {
  final String title;
  final String imagePath;
  final String goRoute;
  const DeliveryTypeBox({
    super.key,
    required this.title,
    required this.imagePath,
    required this.goRoute,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () {
        context.pushNamed(goRoute);
      },
      child: Container(
        height: 110 * ratio,
        decoration: BoxDecoration(
          color: const Color(0xffffffff),
          borderRadius: BorderRadius.circular(20 * ratio),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withValues(alpha: 0.05),
              blurRadius: 14 * ratio,
              offset: Offset(0, 9 * ratio),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(imagePath, width: 30 * ratio, height: 30 * ratio),
            SizedBox(width: 15 * ratio),
            Text(title, style: AppFontStyles.s16w600(ratio)),
          ],
        ),
      ),
    );
  }
}
