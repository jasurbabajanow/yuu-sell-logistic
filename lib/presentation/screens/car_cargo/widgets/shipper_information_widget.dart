import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class ShipperInfoSheet extends StatelessWidget {
  const ShipperInfoSheet({super.key});

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
          topLeft: Radius.circular(30 * ratio),
          topRight: Radius.circular(30 * ratio),
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text(
                'Shipper Information',
                style: TextStyle(fontSize: 16 * ratio, fontWeight: FontWeight.w600),
              ),
            ),
            SizedBox(height: 16 * ratio),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12 * ratio, vertical: 12 * ratio),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey.shade300),
                borderRadius: BorderRadius.circular(8 * ratio),
              ),
              child: Row(
                children: [
                  Image.asset(
                    'assets/us_flag.png',
                    width: 24 * ratio,
                    height: 16 * ratio,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: 24 * ratio,
                        height: 16 * ratio,
                        color: Colors.blue,
                        child: Center(
                          child: Text('🇺🇸', style: TextStyle(fontSize: 12 * ratio)),
                        ),
                      );
                    },
                  ),
                  SizedBox(width: 8 * ratio),
                  Text(
                    '+1 231 54535 4654',
                    style: TextStyle(fontSize: 14 * ratio, color: Colors.black87),
                  ),
                  Spacer(),
                  Icon(Icons.keyboard_arrow_down, color: Colors.grey.shade600),
                ],
              ),
            ),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Email', hintText: 'amannn@email.com'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Full name', hintText: 'Aman Amanov'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Full address', hintText: 'USA'),
            CustomTextField2(title: '', hintText: 'Texas'),
            SizedBox(height: 16 * ratio),
            CustomTextField2(title: 'Zip code', hintText: '14754'),
            SizedBox(height: 24 * ratio),
            CustomButton(onTap: (){}, text: 'Save',)
          ],
        ),
      ),
    );
  }
}
