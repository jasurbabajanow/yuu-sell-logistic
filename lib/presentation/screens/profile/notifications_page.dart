import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Notifications',
          style: TextStyle(
            fontSize: 20,
            color: Colors.black,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Today',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/ticker_sale.svg',
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
            title: 'Get 20% Discount Code',
            subtitle: 'Get discount codes from sharing with friends.',
            hasRedDot: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/check_circle.svg',
            iconColor: Colors.teal,
            iconBgColor: Colors.teal.shade50,
            title: 'Air-2025-00124',
            subtitle: 'All express',
            rightText: 'USA to TKM',
            hasRedDot: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/ticker_sale.svg',
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
            title: 'Get 20% Discount Code',
            subtitle: 'Get discount codes from sharing with friends.',
            hasRedDot: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/ticker_sale.svg',
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
            title: 'Get 20% Discount Code',
            subtitle: 'Get discount codes from sharing with friends.',
            hasRedDot: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/check_circle.svg',
            iconColor: Colors.teal,
            iconBgColor: Colors.teal.shade50,
            title: 'Air-2025-00124',
            subtitle: 'All express',
            rightText: 'USA to TKM',
            hasRedDot: true,
          ),
          const SizedBox(height: 24),
          const Text(
            'Yesterday',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: Colors.grey,
            ),
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/check_circle.svg',
            iconColor: Colors.teal,
            iconBgColor: Colors.teal.shade50,
            title: 'Air-2025-00124',
            subtitle: 'All express',
            rightText: 'USA to TKM',
            hasRedDot: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/ticker_sale.svg',
            iconColor: Colors.blue,
            iconBgColor: Colors.blue.shade50,
            title: 'Get 20% Discount Code',
            subtitle: 'Get discount codes from sharing with friends.',
            hasRedDot: true,
          ),
          const SizedBox(height: 12),
          _buildNotificationItem(
            assetPath: 'assets/icons/check_circle.svg',
            iconColor: Colors.teal,
            iconBgColor: Colors.teal.shade50,
            title: 'Air-2025-00124',
            subtitle: 'All express',
            rightText: 'USA to TKM',
            hasRedDot: true,
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationItem({
    required String assetPath,
    required Color iconColor,
    required Color iconBgColor,
    required String title,
    required String subtitle,
    String? rightText,
    bool hasRedDot = false,
  }) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(assetPath, color: iconColor),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        subtitle,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ),
                    if (rightText != null)
                      Text(
                        rightText,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey.shade600,
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (hasRedDot)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}
