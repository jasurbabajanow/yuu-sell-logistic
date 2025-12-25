import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/delivery_calculate_dialog.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_main_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class DeliveryCalculateSubPage1 extends StatelessWidget {
  const DeliveryCalculateSubPage1({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Truck Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20 * ratio,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsetsGeometry.symmetric(
          vertical: 12 * ratio,
          horizontal: 20 * ratio,
        ),
        child: Column(
          children: [
            Text(
              'Maximum permissible parcel dimensions 300x170x170sm, weight: 1000kg',
              style: AppFontStyles.s12w500(ratio).copyWith(fontSize: 10),
            ),
            SizedBox(height: 15),
            _buildTextField(context, 'Weight lb'),
            SizedBox(height: 15),
            _buildTextField(context, 'Length in'),
            SizedBox(height: 15),
            _buildTextField(context, 'Width in'),
            SizedBox(height: 15),
            _buildTextField(context, 'Height in'),
            Spacer(),
            CustomButton(
              onTap: () {
                DeliveryCalculatorDialog.show(
                  context,
                  price: '\$136.71',
                  destination: 'China > USA, Alabama',
                  parcelSize: '12x12x12',
                  packageWeight: '12',
                  deliveryType: 'Door',
                  shipmentType: 'Correspondence (package)',
                  onCreateParcel: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateParcelMainPage(),
                      ),
                    );
                  },
                );
              },
              text: 'CALCULATE',
            ),
            SizedBox(height: 10 * ratio),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateParcelMainPage(),
                  ),
                );
              },
              text: 'CREATE PARCEL',
              isFilled: false,
            ),
            SizedBox(height: 40 * ratio),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(BuildContext context, String hintText) {
    final ratio = AppSizes.ratio(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: AppColors.white,
            border: Border.all(color: AppColors.textFieldBorder),
            borderRadius: BorderRadius.circular(12 * ratio),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 16 * ratio,
              // vertical: 0 * ratio,
            ),
            child: TextField(
              decoration: InputDecoration(
                border: InputBorder.none,
                fillColor: AppColors.white,
                hintText: hintText,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
