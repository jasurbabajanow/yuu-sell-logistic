import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_dropdown_jjj.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class CarInfoSheet extends StatelessWidget {
  const CarInfoSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      padding: EdgeInsets.only(
        left: 20 * ratio,
        right: 20 * ratio,
        top: 20 * ratio,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40 * ratio,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * ratio),
          topRight: Radius.circular(20 * ratio),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Car Information',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16 * ratio),
            CustomDropdown2(label: 'Mark of car', hint: 'TOYOTA'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Model', hintText: 'CAMRY'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Year', hintText: '2012'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Mileage', hintText: '100000'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'VIN nomer', hintText: '121354364'),
            SizedBox(height: 24 * ratio),
            CustomButton(onTap: () {}, text: 'Save'),
          ],
        ),
      ),
    );
  }
}
