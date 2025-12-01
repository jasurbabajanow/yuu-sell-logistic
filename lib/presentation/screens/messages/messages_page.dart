import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/messages/components/message_item.dart';
import 'package:yuu_sell/presentation/screens/messages/message_details_page.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Messages',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      floatingActionButton: SizedBox(
        width: 60 * ratio,
        height: 60 * ratio,
        child: FloatingActionButton(
          backgroundColor: AppColors.main,
          shape: const CircleBorder(),
          onPressed: () {},
          child: Icon(
            Icons.chat_bubble_outline,
            color: Colors.white,
            size: 28 * ratio,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20 * ratio),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 16 * ratio),
              // Search Bar
              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 16 * ratio,
                  vertical: 12 * ratio,
                ),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(10 * ratio),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 16 * ratio,
                          color: Colors.grey.shade600,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.search,
                      color: Colors.grey.shade600,
                      size: 24 * ratio,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 24 * ratio),

              // Today Section
              Text(
                'Today',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12 * ratio),
              MessageItem(
                title: 'Get 20% Discount Code',
                subtitle: 'Get discount codes from sharing with friends.',
                icon: Icons.local_offer,
                iconBgColor: Colors.blue.shade50,
                iconColor: AppColors.main,
                hasUnread: true,
              ),
              MessageItem(
                title: 'Air-2025-00124',
                subtitle: 'All express        USA to TKM',
                icon: Icons.check_circle,
                iconBgColor: Colors.teal.shade50,
                iconColor: Colors.teal,
                hasUnread: true,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MessageDetailsPage(),
                    ),
                  );
                },
              ),
              MessageItem(
                title: 'Get 20% Discount Code',
                subtitle: 'Get discount codes from sharing with friends.',
                icon: Icons.local_offer,
                iconBgColor: Colors.blue.shade50,
                iconColor: AppColors.main,
                hasUnread: true,
              ),
              MessageItem(
                title: 'Get 20% Discount Code',
                subtitle: 'Get discount codes from sharing with friends.',
                icon: Icons.local_offer,
                iconBgColor: Colors.blue.shade50,
                iconColor: AppColors.main,
                hasUnread: true,
              ),
              MessageItem(
                title: 'Air-2025-00124',
                subtitle: 'All express        USA to TKM',
                icon: Icons.check_circle,
                iconBgColor: Colors.teal.shade50,
                iconColor: Colors.teal,
                hasUnread: true,
              ),
              SizedBox(height: 24 * ratio),

              // Yesterday Section
              Text(
                'Yesterday',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 12 * ratio),
              MessageItem(
                title: 'Air-2025-00124',
                subtitle: 'All express        USA to TKM',
                icon: Icons.check_circle,
                iconBgColor: Colors.teal.shade50,
                iconColor: Colors.teal,
                hasUnread: true,
              ),
              MessageItem(
                title: 'Get 20% Discount Code',
                subtitle: 'Get discount codes from sharing with friends.',
                icon: Icons.local_offer,
                iconBgColor: Colors.blue.shade50,
                iconColor: AppColors.main,
                hasUnread: true,
              ),
              MessageItem(
                title: 'Air-2025-00124',
                subtitle: 'All express        USA to TKM',
                icon: Icons.check_circle,
                iconBgColor: Colors.teal.shade50,
                iconColor: Colors.teal,
                hasUnread: true,
              ),
              SizedBox(height: 100 * ratio),
            ],
          ),
        ),
      ),
    );
  }
}
