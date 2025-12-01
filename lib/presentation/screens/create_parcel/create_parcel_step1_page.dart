import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/components/delivery_service_card.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/components/step_progress_bar.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_step2_3_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class CreateParcelStep1Page extends StatelessWidget {
  const CreateParcelStep1Page({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'Create parcel',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Column(
        children: [
          // Progress bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
            child: const StepProgressBar(currentStep: 1),
          ),
          SizedBox(height: 24 * ratio),
          // Title
          Text(
            'Step 1 : Delivery options',
            style: TextStyle(
              fontSize: 16 * ratio,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20 * ratio),
          // Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Choose a delivery service',
                      style: TextStyle(
                        fontSize: 14 * ratio,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 16 * ratio),
                    const DeliveryServiceCard(
                      badgeText: 'Best price',
                      badgeColor: Colors.green,
                      price: '14.50\$',
                      deliveryTime: '1-4 days',
                      showPrintLabel: true,
                    ),
                    const DeliveryServiceCard(
                      badgeText: 'Fasted',
                      badgeColor: Colors.pink,
                      price: '14.50\$',
                      deliveryTime: '1-4 days',
                    ),
                    const DeliveryServiceCard(
                      badgeText: 'Best price',
                      badgeColor: Colors.green,
                      price: '14.50\$',
                      deliveryTime: '1-4 days',
                      showPrintLabel: true,
                    ),
                    SizedBox(height: 20 * ratio),
                    CustomButton(
                      text: 'Next',
                      onTap: () {
                        // Navigate to step 2
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CreateParcelStep2And3Page(),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 12 * ratio),
                    CustomButton(
                      text: 'Back',
                      isFilled: false,
                      onTap: () => Navigator.pop(context),
                    ),
                    SizedBox(height: 40 * ratio),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
