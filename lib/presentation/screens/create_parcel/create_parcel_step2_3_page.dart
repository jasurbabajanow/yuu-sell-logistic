import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/custom_dropdown.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/components/step_progress_bar.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_step4_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class CreateParcelStep2And3Page extends StatefulWidget {
  const CreateParcelStep2And3Page({super.key});

  @override
  State<CreateParcelStep2And3Page> createState() =>
      _CreateParcelStep2And3PageState();
}

class _CreateParcelStep2And3PageState extends State<CreateParcelStep2And3Page> {
  int currentStep = 2; // Start at step 2 (sender), then move to step 3 (receiver)

  void _goToNextStep() {
    if (currentStep == 2) {
      setState(() {
        currentStep = 3;
      });
    } else {
      // Navigate to step 4
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const CreateParcelStep4Page(),
        ),
      );
    }
  }

  void _goBack() {
    if (currentStep == 3) {
      setState(() {
        currentStep = 2;
      });
    } else {
      Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    final isSender = currentStep == 2;

    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: _goBack,
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
            child: StepProgressBar(currentStep: currentStep),
          ),
          SizedBox(height: 24 * ratio),
          // Title with animation
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 300),
            child: Text(
              isSender ? 'Step 2 : Ship from' : 'Step 3 : Deliver to',
              key: ValueKey(currentStep),
              style: TextStyle(
                fontSize: 16 * ratio,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20 * ratio),
          // Content with animation
          Expanded(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 300),
              child: SingleChildScrollView(
                key: ValueKey(currentStep),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        isSender
                            ? '1. Sender information'
                            : '1. Receiver information',
                        style: TextStyle(
                          fontSize: 14 * ratio,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      SizedBox(height: 16 * ratio),
                      CustomTextField2(
                        title: '',
                        hintText: isSender
                            ? 'Full name / Company name'
                            : 'Full name/Company',
                      ),
                      SizedBox(height: 12 * ratio),
                      const CustomTextField2(title: '', hintText: 'Last name'),
                      SizedBox(height: 12 * ratio),
                      const CustomTextField2(title: '', hintText: 'email'),
                      SizedBox(height: 12 * ratio),
                      const CustomTextField2(
                          title: '', hintText: 'phone number'),
                      SizedBox(height: 12 * ratio),
                      CustomDropdown(label: '', hint: 'Address', onTap: () {}),
                      SizedBox(height: 12 * ratio),
                      const CustomTextField2(title: '', hintText: 'City'),
                      SizedBox(height: 12 * ratio),
                      CustomDropdown(label: '', hint: 'State', onTap: () {}),
                      SizedBox(height: 12 * ratio),
                      const CustomTextField2(title: '', hintText: 'Zip code'),
                      SizedBox(height: 24 * ratio),
                      // Bottom info
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Delivery from warehouse',
                            style: TextStyle(
                              fontSize: 14 * ratio,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          Row(
                            children: [
                              Text(
                                '1-4 days',
                                style: TextStyle(
                                  fontSize: 14 * ratio,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey.shade600,
                                ),
                              ),
                              SizedBox(width: 8 * ratio),
                              Icon(
                                Icons.local_shipping_outlined,
                                size: 20 * ratio,
                                color: Colors.grey.shade600,
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(height: 12 * ratio),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Total',
                            style: TextStyle(
                              fontSize: 16 * ratio,
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            '14.50\$',
                            style: TextStyle(
                              fontSize: 18 * ratio,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 20 * ratio),
                      CustomButton(
                        text: 'Next',
                        onTap: _goToNextStep,
                      ),
                      SizedBox(height: 12 * ratio),
                      CustomButton(
                        text: 'Back',
                        isFilled: false,
                        onTap: _goBack,
                      ),
                      SizedBox(height: 40 * ratio),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
