import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/plain_bottom_sheet.dart';
import 'package:yuu_sell/presentation/widgets/custom_dropdown_jjj.dart';
import 'package:yuu_sell/presentation/widgets/flexible_text_field.dart';

class DeliverInfoWidget extends StatelessWidget {
  const DeliverInfoWidget({super.key});

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
                'Deliver Information',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            SizedBox(height: 16 * ratio),

            CustomDropdown2(
              label: 'Country',
              hint: 'Dubai',
              onTap: () => _showCountrySheet(context),
            ),
            SizedBox(height: 14 * ratio),
            Padding(
              padding: EdgeInsets.only(bottom: 12 * ratio),
              child: Text(
                'Phone number',
                style: AppFontStyles.s14w500(
                  ratio,
                ).copyWith(color: AppColors.formDataLabel),
              ),
            ),
            FlexibleTextField(hintText: '+1 234 567 890', height: 40),
            SizedBox(height: 14 * ratio),
            Padding(
              padding: EdgeInsets.only(bottom: 12 * ratio),
              child: Text(
                'Email',
                style: AppFontStyles.s14w500(
                  ratio,
                ).copyWith(color: AppColors.formDataLabel),
              ),
            ),
            FlexibleTextField(hintText: 'testmail@example.com', height: 40),
            SizedBox(height: 14 * ratio),
            Padding(
              padding: EdgeInsets.only(bottom: 12 * ratio),
              child: Text(
                'Fullname',
                style: AppFontStyles.s14w500(
                  ratio,
                ).copyWith(color: AppColors.formDataLabel),
              ),
            ),
            FlexibleTextField(hintText: 'Amanow Aman', height: 40),
            SizedBox(height: 14 * ratio),
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(),
                      borderRadius: BorderRadius.circular(12 * ratio),
                    ),
                    height: 40 * ratio,
                    child: Center(
                      child: Text(
                        'post',
                        style: AppFontStyles.s15w600(
                          ratio,
                        ).copyWith(color: AppColors.formDataLabel),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 8 * ratio),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12 * ratio),
                      color: AppColors.main,
                    ),
                    height: 40 * ratio,
                    child: Center(
                      child: Text(
                        'port',
                        style: AppFontStyles.s15w600(
                          ratio,
                        ).copyWith(color: AppColors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 14 * ratio),
            CustomDropdown2(
              label: 'Choose your place',
              hint: 'port',
              onTap: () => _showPlaceSheet(context),
            ),
          ],
        ),
      ),
    );
  }

  void _showCountrySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) =>
          PlainBottomSheet(items: ['USA', 'ITALY', 'RUSSIA', 'UKRAINE', 'UAE']),
    );
  }

  void _showPlaceSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlainBottomSheet(items: ['port', 'post']),
    );
  }
}
