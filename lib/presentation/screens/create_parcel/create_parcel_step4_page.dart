import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/components/step_progress_bar.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class CreateParcelStep4Page extends StatelessWidget {
  const CreateParcelStep4Page({super.key});

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
            child: const StepProgressBar(currentStep: 4),
          ),
          SizedBox(height: 24 * ratio),
          // Title
          Text(
            'Step 4 : Summary',
            style: TextStyle(
              fontSize: 16 * ratio,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
          SizedBox(height: 20 * ratio),
          // Scrollable Content
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Parcel details
                    Text(
                      'Parcel details',
                      style: TextStyle(
                        fontSize: 16 * ratio,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12 * ratio),
                    _buildDetailText('From', ratio),
                    _buildValueText(
                        'United States, 07096, New Jersey, Port Reading', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('To', ratio),
                    _buildValueText(
                        'United States, 19133, Pen, Pennyhania, Philadelphia',
                        ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('To', ratio),
                    _buildValueText('15 lb', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Dimensions', ratio),
                    _buildValueText('5 x 5 x 5 in', ratio),
                    SizedBox(height: 24 * ratio),

                    // Sender
                    Text(
                      'Sender',
                      style: TextStyle(
                        fontSize: 16 * ratio,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12 * ratio),
                    _buildDetailText('Name', ratio),
                    _buildValueText('Victoria Smith', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Phone number', ratio),
                    _buildValueText('+1 321 123 9535', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Email', ratio),
                    _buildValueText('manualfola@gmail.com', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Pick up details', ratio),
                    _buildValueText(
                        'Port Reading,  Markley Street, EGO, New Jersey, United States',
                        ratio),
                    SizedBox(height: 24 * ratio),

                    // Receiver
                    Text(
                      'Receiver',
                      style: TextStyle(
                        fontSize: 16 * ratio,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12 * ratio),
                    _buildDetailText('Name', ratio),
                    _buildValueText('Joe Smith', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Phone number', ratio),
                    _buildValueText('+1 321 123 9535', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Email', ratio),
                    _buildValueText('manualfola@gmail.com', ratio),
                    SizedBox(height: 8 * ratio),
                    _buildDetailText('Pick up details', ratio),
                    _buildValueText(
                        'Port Reading,  Markley Street, EGO, New Jersey, United States',
                        ratio),
                    SizedBox(height: 24 * ratio),

                    // Promo code
                    Text(
                      'Promo code',
                      style: TextStyle(
                        fontSize: 16 * ratio,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8 * ratio),
                    Text(
                      'Add your promo code (optional)',
                      style: TextStyle(
                        fontSize: 14 * ratio,
                        fontWeight: FontWeight.w400,
                        color: Colors.grey.shade600,
                      ),
                    ),
                    SizedBox(height: 12 * ratio),
                    const CustomTextField2(
                      title: '',
                      hintText: '',
                    ),
                    SizedBox(height: 12 * ratio),
                    CustomButton(
                      text: 'Apply',
                      onTap: () {},
                    ),
                    SizedBox(height: 24 * ratio),

                    // Insurance
                    Text(
                      'Insurance',
                      style: TextStyle(
                        fontSize: 16 * ratio,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 12 * ratio),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Insurance amount',
                          style: TextStyle(
                            fontSize: 14 * ratio,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey.shade600,
                          ),
                        ),
                        Text(
                          '10.0\$',
                          style: TextStyle(
                            fontSize: 16 * ratio,
                            fontWeight: FontWeight.w600,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 16 * ratio),
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
                    SizedBox(height: 16 * ratio),
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
                    SizedBox(height: 24 * ratio),
                    CustomButton(
                      text: 'Pay (14.50\$)',
                      onTap: () {
                        // Process payment
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

  Widget _buildDetailText(String text, double ratio) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 14 * ratio,
        fontWeight: FontWeight.w400,
        color: Colors.grey.shade600,
      ),
    );
  }

  Widget _buildValueText(String text, double ratio) {
    return Text(
      text,
      style: TextStyle(
        fontSize: 16 * ratio,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
