import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
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
    );
  }
}
