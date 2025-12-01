import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';

class MessageItem extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final Color iconBgColor;
  final Color iconColor;
  final bool hasUnread;
  final VoidCallback? onTap;

  const MessageItem({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.iconBgColor,
    required this.iconColor,
    this.hasUnread = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 16 * ratio,
          vertical: 12 * ratio,
        ),
        margin: EdgeInsets.only(bottom: 8 * ratio),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12 * ratio),
        ),
        child: Row(
          children: [
            // Icon
            Container(
              width: 48 * ratio,
              height: 48 * ratio,
              decoration: BoxDecoration(
                color: iconBgColor,
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: iconColor,
                size: 24 * ratio,
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
                      fontSize: 16 * ratio,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
                  ),
                  SizedBox(height: 4 * ratio),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14 * ratio,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
            // Unread indicator
            if (hasUnread)
              Container(
                width: 10 * ratio,
                height: 10 * ratio,
                decoration: const BoxDecoration(
                  color: Colors.red,
                  shape: BoxShape.circle,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
