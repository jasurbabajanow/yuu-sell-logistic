// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class PlainBottomSheet extends StatefulWidget {
  final List<String> items;
  const PlainBottomSheet({super.key, required this.items});

  @override
  State<PlainBottomSheet> createState() => _PlainBottomSheetState();
}

class _PlainBottomSheetState extends State<PlainBottomSheet> {
  late String selectedOption;

  @override
  void initState() {
    selectedOption = widget.items[0];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Change User Information',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          ),
          const SizedBox(height: 24),
          for (var i = 0; i < widget.items.length; i++)
            _buildRadioOption(widget.items[i]),
          _buildRadioOption('IAAI'),
          _buildRadioOption('MANHEIM'),
          _buildRadioOption('SALVAGENOV'),
          _buildRadioOption('Other'),
          const SizedBox(height: 24),
          CustomButton(onTap: () {}, text: 'Save'),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String option) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedOption = option;
        });
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        margin: const EdgeInsets.only(bottom: 10),
        decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: Color(0xff000000).withOpacity(0.05),
              spreadRadius: 0,
              blurRadius: 14,
              offset: const Offset(0, 9),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              option,
              style: AppFontStyles.s14w600(
                ratio,
              ).copyWith(color: Color(0xff222222)),
            ),
            ?selectedOption == option
                ? Center(
                    child: Container(
                      width: 13,
                      height: 13,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Color(0xFF355DEE),
                      ),
                    ),
                  )
                : null,
          ],
        ),
      ),
    );
  }
}
