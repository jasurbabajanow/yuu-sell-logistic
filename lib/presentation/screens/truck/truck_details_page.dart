import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class TruckDetailsPage extends StatelessWidget {
  const TruckDetailsPage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 30.0 * ratio,
            vertical: 20 * ratio,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildRow(context, 'Tracking number', 'AIR-00045'),
              _buildRow(context, 'Sender', 'Ali Express'),
              _buildRow(context, 'Receiver', 'John Doe'),
              _buildRow(context, 'Route', 'Bangkok → Dubai'),
              _buildRow(context, 'Shipment type', 'Air Cargo'),
              _buildRow(context, 'Delivery type', 'Door-to-Door'),
              _buildRow(context, 'Status', 'In Transit'),
              _buildRow(context, 'Last update', '2025-10-09'),
              // Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Delivery from warehouse',
                    style: AppFontStyles.s12w400(
                      ratio,
                    ).copyWith(color: Color(0xff666666)),
                  ),
                  Row(
                    children: [
                      Text(
                        '1-4 days',
                        style: AppFontStyles.s12w400(
                          ratio,
                        ).copyWith(fontSize: 10, color: Color(0xff666666)),
                      ),
                      SizedBox(width: 4 * ratio),
                      Icon(Icons.local_shipping_outlined),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 20 * ratio),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total (paid)',
                    style: AppFontStyles.s16w500(
                      ratio,
                    ).copyWith(color: Color(0xff222222)),
                  ),
                  Text(
                    "64.32\$",
                    style: AppFontStyles.s16w500(
                      ratio,
                    ).copyWith(color: Color(0xff222222)),
                  ),
                ],
              ),
              SizedBox(height: 15 * ratio),
              CustomButton(
                isFilled: false,
                onTap: () {
                  context.pop();
                },
                text: 'Back',
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRow(BuildContext context, String mainTitle, String subTitle) {
    final ratio = AppSizes.ratio(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          mainTitle,
          style: AppFontStyles.s16w500(
            ratio,
          ).copyWith(color: AppColors.formDataLabel),
        ),
        SizedBox(height: 14 * ratio),
        Text(
          subTitle,
          style: AppFontStyles.s14w400(
            ratio,
          ).copyWith(color: Color(0xff787878)),
        ),
        SizedBox(height: 14 * ratio),
      ],
    );
  }
}
