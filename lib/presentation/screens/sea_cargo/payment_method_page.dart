import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class PaymentMethodPage extends StatelessWidget {
  const PaymentMethodPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
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
          'Payment method',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17 * ratio,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20.0 * ratio,
          vertical: 20 * ratio,
        ),
        child: Column(
          children: [
            Container(
              height: 60 * ratio,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 14,
                    offset: Offset(0, 9 * ratio),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0 * ratio),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/yuusell.svg',
                      height: 30 * ratio,
                      width: 300 * ratio,
                    ),
                    SizedBox(width: 10 * ratio),
                    Text(
                      "YuuSell",
                      style: AppFontStyles.s12w600(
                        ratio,
                      ).copyWith(fontSize: 16 * ratio),
                    ),
                    Spacer(),
                    Text(
                      '\$44.50',
                      style: AppFontStyles.s12w600(
                        ratio,
                      ).copyWith(fontSize: 16 * ratio),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15 * ratio),
            Container(
              height: 60 * ratio,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 14,
                    offset: Offset(0, 9 * ratio),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0 * ratio),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/fedex.svg',
                      height: 30 * ratio,
                      width: 300 * ratio,
                    ),
                    SizedBox(width: 10 * ratio),
                    Text(
                      "FedEx",
                      style: AppFontStyles.s12w600(
                        ratio,
                      ).copyWith(fontSize: 16 * ratio),
                    ),
                    Spacer(),
                    Text('\$52.20',
                        style: AppFontStyles.s12w600(
                          ratio,
                        ).copyWith(fontSize: 16 * ratio)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15 * ratio),
            Container(
              height: 60 * ratio,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 14,
                    offset: Offset(0, 9 * ratio),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0 * ratio),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/ups.svg',
                      height: 30 * ratio,
                      width: 300 * ratio,
                    ),
                    SizedBox(width: 10 * ratio),
                    Text(
                      "UPS",
                      style: AppFontStyles.s12w600(
                        ratio,
                      ).copyWith(fontSize: 16 * ratio),
                    ),
                    Spacer(),
                    Text('\$61.20',
                        style: AppFontStyles.s12w600(
                          ratio,
                        ).copyWith(fontSize: 16 * ratio)),
                  ],
                ),
              ),
            ),
            SizedBox(height: 15 * ratio),
            Container(
              height: 60 * ratio,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(20 * ratio),
                boxShadow: [
                  BoxShadow(
                    color: Color(0xff000000).withOpacity(0.05),
                    spreadRadius: 0,
                    blurRadius: 14,
                    offset: Offset(0, 9 * ratio),
                  ),
                ],
              ),
              child: Padding(
                padding: EdgeInsets.all(15.0 * ratio),
                child: Row(
                  children: [
                    SvgPicture.asset(
                      'assets/icons/post_office.svg',
                      height: 30 * ratio,
                      width: 300 * ratio,
                    ),
                    SizedBox(width: 10 * ratio),
                    Text(
                      "Post Office",
                      style: AppFontStyles.s12w600(
                        ratio,
                      ).copyWith(fontSize: 16 * ratio),
                    ),
                    Spacer(),
                    Text('\$66.20',
                        style: AppFontStyles.s12w600(
                          ratio,
                        ).copyWith(fontSize: 16 * ratio)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
