import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/sub_pages/warning_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class PaymentSheetWidget extends StatelessWidget {
  const PaymentSheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
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
          Text(
            "Payment method",
            style: AppFontStyles.s18w600(ratio).copyWith(fontSize: 20),
          ),
          SizedBox(height: 20 * ratio),
          Text(
            "USD \$136.71",
            style: AppFontStyles.s18w600(ratio).copyWith(color: AppColors.main),
          ),
          SizedBox(height: 20 * ratio),
          CustomButton(
            onTap: () {
              context.pushNamed('payment');
            },
            text: 'Pay now',
          ),
          SizedBox(height: 10 * ratio),
          CustomButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => WarningPage()),
              );
            },
            text: 'Until 25 days',
          ),
        ],
      ),
    );
  }
}
