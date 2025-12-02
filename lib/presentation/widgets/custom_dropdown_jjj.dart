import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class CustomDropdown2 extends StatelessWidget {
  final String label;
  final String hint;
  final bool showFlag;
  final String? flagEmoji;
  final VoidCallback? onTap;

  const CustomDropdown2({
    super.key,
    required this.label,
    required this.hint,
    this.showFlag = false,
    this.flagEmoji,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16 * ratio,
            fontWeight: FontWeight.bold,
            color: Colors.black,
            
          ),
        ),
        SizedBox(height: 10 * ratio),
        GestureDetector(
          onTap: onTap,
          child: Container(
            height: 40 * ratio,
            padding: EdgeInsets.only(left: 12 * ratio, right: 8 * ratio),

            decoration: BoxDecoration(
              color: AppColors.white,
              border: Border.all(color: const Color(0xFF222222), width: 1),
              borderRadius: BorderRadius.circular(10 * ratio),
            ),
            child: Row(
              children: [
                if (showFlag) ...[
                  Container(
                    width: 32 * ratio,
                    height: 22 * ratio,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade200,
                      borderRadius: BorderRadius.circular(4 * ratio),
                    ),
                    child: Center(
                      child: Text(
                        flagEmoji ?? '🏳️',
                        style: TextStyle(fontSize: 16 * ratio),
                      ),
                    ),
                  ),
                  SizedBox(width: 12 * ratio),
                ],
                Expanded(
                  child: Text(
                    hint,
                    style: TextStyle(
                      fontSize: 14 * ratio,
                      fontWeight: FontWeight.w400,
                      color: hint.startsWith('Choose') || hint == 'To'
                          ? Colors.grey.shade400
                          : Colors.black87,
                    ),
                  ),
                ),
                Icon(
                  Icons.keyboard_arrow_down,
                  size: 24 * ratio,
                  color: Colors.grey.shade600,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
