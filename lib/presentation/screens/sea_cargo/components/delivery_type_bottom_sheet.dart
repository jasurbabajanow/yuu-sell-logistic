import 'package:flutter/material.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class DeliveryTypeBottomSheet extends StatefulWidget {
  const DeliveryTypeBottomSheet({super.key});

  @override
  State<DeliveryTypeBottomSheet> createState() => _DeliveryTypeBottomSheetState();
}

class _DeliveryTypeBottomSheetState extends State<DeliveryTypeBottomSheet> {
  String selectedOption = 'Port-to-Port (P2P)';

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
          // const Text(
          //   'Change User Information',
          //   style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
          // ),
          const SizedBox(height: 24),
          _buildRadioOption('Port-to-Port (P2P)'),
          _buildRadioOption('Door-to-Port (D2P)'),
          _buildRadioOption('Port-to-Door (P2D)'),
          _buildRadioOption('Door-to-Door (D2D)'),
          const SizedBox(height: 24),
          CustomButton(onTap: () {}, text: 'Save'),
        ],
      ),
    );
  }

  Widget _buildRadioOption(String option) {
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
              style: const TextStyle(fontSize: 15, color: Colors.black87),
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