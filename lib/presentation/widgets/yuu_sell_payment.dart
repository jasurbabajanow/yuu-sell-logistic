import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/widgets/create_parcel_result.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/flexible_text_field.dart';

class YuuSellPayment extends StatelessWidget {
  const YuuSellPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
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
        title: Text(
          'Yuusell payment',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17 * ratio,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.bgWhite,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20 * ratio,
            vertical: 12 * ratio,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(bottom: 10 * ratio),
                child: Text(
                  'Number card',
                  style: AppFontStyles.s14w400(
                    ratio,
                  ).copyWith(color: AppColors.textFieldTitle),
                ),
              ),
              FlexibleTextField(
                hintText: '**** **** **** ****',
                isPrefix: true,
              ),
              SizedBox(height: 14 * ratio),
              Row(
                children: [
                  Expanded(child: FlexibleTextField(hintText: 'MM/YY')),
                  SizedBox(width: 12 * ratio),
                  Expanded(child: FlexibleTextField(hintText: 'CVC')),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 14 * ratio, bottom: 8 * ratio),
                child: Text(
                  'Cardholder name',
                  style: AppFontStyles.s14w400(
                    ratio,
                  ).copyWith(color: AppColors.textFieldTitle),
                ),
              ),
              FlexibleTextField(hintText: 'Fullname on card'),
              Padding(
                padding: EdgeInsets.only(top: 14 * ratio, bottom: 8 * ratio),
                child: Text(
                  'Billing address',
                  style: AppFontStyles.s14w400(
                    ratio,
                  ).copyWith(color: AppColors.textFieldTitle),
                ),
              ),
              FlexibleTextField(hintText: 'Fullname on card', isSuffix: true),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'Address line 1'),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'Address line 2'),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'City'),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'Province'),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'Postal code'),
              Padding(
                padding: EdgeInsets.only(top: 14 * ratio, bottom: 8 * ratio),
                child: Text(
                  'VAT information',
                  style: AppFontStyles.s14w400(
                    ratio,
                  ).copyWith(color: AppColors.textFieldTitle),
                ),
              ),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'Bussiness name'),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: 'China', isSuffix: true),
              SizedBox(height: 10 * ratio),
              FlexibleTextField(hintText: '1234567891234'),
              SizedBox(height: 10 * ratio),
              Row(
                children: [
                  Checkbox(value: false, onChanged: (val) {}),
                  Text(
                    'Save my information for faster checkout',
                    style: AppFontStyles.s14w400(ratio),
                  ),
                ],
              ),
              SizedBox(height: 10 * ratio),
              Padding(
                padding: EdgeInsets.only(bottom: 30 * ratio),
                child: CustomButton(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateParcelResult(),
                      ),
                    );
                  },
                  text: 'Pay 44.50\$',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
