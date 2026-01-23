import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';

class DeliveryServiceCard extends StatelessWidget {
  final String badgeText;
  final Color badgeColor;
  final String price;
  final String deliveryTime;
  final bool showPrintLabel;
  final bool isSelected;

  const DeliveryServiceCard({
    super.key,
    required this.badgeText,
    required this.badgeColor,
    required this.price,
    required this.deliveryTime,
    this.showPrintLabel = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      margin: EdgeInsets.only(bottom: 16 * ratio),
      padding: EdgeInsets.all(16 * ratio),
      decoration: BoxDecoration(
        color: isSelected ? badgeColor.withValues(alpha: 0.05) : Colors.white,
        borderRadius: BorderRadius.circular(12 * ratio),
        border: Border.all(
          color: isSelected ? badgeColor : Colors.grey.shade200,
          width: isSelected ? 2 : 1,
        ),
      ),
      child: Column(
        children: [
          // Badge header
          Container(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * ratio,
              vertical: 8 * ratio,
            ),
            decoration: BoxDecoration(
              color: badgeColor.withValues(alpha: 0.3),
              borderRadius: BorderRadius.circular(8 * ratio),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  badgeText,
                  style: TextStyle(
                    fontSize: 14 * ratio,
                    fontWeight: FontWeight.w600,
                    color: badgeColor,
                  ),
                ),
                if (showPrintLabel)
                  Row(
                    children: [
                      Text(
                        'Print label',
                        style: TextStyle(
                          fontSize: 12 * ratio,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      SizedBox(width: 4 * ratio),
                      Icon(
                        Icons.print,
                        size: 16 * ratio,
                        color: Colors.grey.shade600,
                      ),
                    ],
                  ),
              ],
            ),
          ),
          SizedBox(height: 12 * ratio),
          // Service details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Drop-off',
                style: TextStyle(
                  fontSize: 14 * ratio,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Row(
                children: [
                  Text(
                    deliveryTime,
                    style: TextStyle(
                      fontSize: 14 * ratio,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                  SizedBox(width: 4 * ratio),
                  Icon(
                    Icons.local_shipping,
                    size: 18 * ratio,
                    color: Colors.blue,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 8 * ratio),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Pay online',
                style: TextStyle(
                  fontSize: 14 * ratio,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,
                ),
              ),
              Text(
                price,
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
