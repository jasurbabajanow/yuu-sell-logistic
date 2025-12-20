import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/custom_dropdown.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/components/delivery_service_card.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/components/step_progress_bar.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class CreateParcelStepsPage extends StatefulWidget {
  const CreateParcelStepsPage({super.key});

  @override
  State<CreateParcelStepsPage> createState() => _CreateParcelStepsPageState();
}

class _CreateParcelStepsPageState extends State<CreateParcelStepsPage> {
  int currentStep =
      1; // 1 = Delivery options, 2 = Sender, 3 = Receiver, 4 = Summary

  void _goToNextStep() {
    if (currentStep < 4) {
      setState(() {
        currentStep++;
      });
    } else {
      context.pushNamed('payment');
    }
  }

  void _goBack() {
    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  String _getStepTitle() {
    switch (currentStep) {
      case 1:
        return 'Step 1 : Delivery options';
      case 2:
        return 'Step 2 : Ship from';
      case 3:
        return 'Step 3 : Deliver to';
      case 4:
        return 'Step 4 : Summary';
      default:
        return '';
    }
  }

  String _getNextButtonText() {
    return currentStep == 4 ? 'Pay (14.50\$)' : 'Next';
  }

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
              _getStepTitle(),
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
              child: _buildStepContent(ratio),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildStepContent(double ratio) {
    switch (currentStep) {
      case 1:
        return _buildStep1Content(ratio);
      case 2:
        return _buildStep2Content(ratio);
      case 3:
        return _buildStep3Content(ratio);
      case 4:
        return _buildStep4Content(ratio);
      default:
        return const SizedBox.shrink();
    }
  }

  // Step 1: Delivery options
  Widget _buildStep1Content(double ratio) {
    return SingleChildScrollView(
      key: const ValueKey(1),
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
            CustomButton(text: 'Next', onTap: _goToNextStep),
            SizedBox(height: 12 * ratio),
            CustomButton(text: 'Back', isFilled: false, onTap: _goBack),
            SizedBox(height: 40 * ratio),
          ],
        ),
      ),
    );
  }

  // Step 2: Sender information
  Widget _buildStep2Content(double ratio) {
    return SingleChildScrollView(
      key: const ValueKey(2),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Sender information',
              style: TextStyle(
                fontSize: 14 * ratio,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16 * ratio),
            const CustomTextField2(
              title: '',
              hintText: 'Full name / Company name',
            ),
            SizedBox(height: 12 * ratio),
            const CustomTextField2(title: '', hintText: 'Last name'),
            SizedBox(height: 12 * ratio),
            const CustomTextField2(title: '', hintText: 'email'),
            SizedBox(height: 12 * ratio),
            const CustomTextField2(title: '', hintText: 'phone number'),
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
            CustomButton(text: 'Next', onTap: _goToNextStep),
            SizedBox(height: 12 * ratio),
            CustomButton(text: 'Back', isFilled: false, onTap: _goBack),
            SizedBox(height: 40 * ratio),
          ],
        ),
      ),
    );
  }

  // Step 3: Receiver information
  Widget _buildStep3Content(double ratio) {
    return SingleChildScrollView(
      key: const ValueKey(3),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '1. Receiver information',
              style: TextStyle(
                fontSize: 14 * ratio,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16 * ratio),
            CustomDropdown(label: '', hint: 'Full name/Company', onTap: () {}),
            SizedBox(height: 12 * ratio),
            const CustomTextField2(title: '', hintText: 'Last name'),
            SizedBox(height: 12 * ratio),
            const CustomTextField2(title: '', hintText: 'email'),
            SizedBox(height: 12 * ratio),
            const CustomTextField2(title: '', hintText: 'phone number'),
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
            CustomButton(text: 'Next', onTap: _goToNextStep),
            SizedBox(height: 12 * ratio),
            CustomButton(text: 'Back', isFilled: false, onTap: _goBack),
            SizedBox(height: 40 * ratio),
          ],
        ),
      ),
    );
  }

  // Step 4: Summary
  Widget _buildStep4Content(double ratio) {
    return SingleChildScrollView(
      key: const ValueKey(4),
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
              'United States, 07096, New Jersey, Port Reading',
              ratio,
            ),
            SizedBox(height: 8 * ratio),
            _buildDetailText('To', ratio),
            _buildValueText(
              'United States, 19133, Pen, Pennyhania, Philadelphia',
              ratio,
            ),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Weight', ratio),
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
              ratio,
            ),
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
              ratio,
            ),
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
            const CustomTextField2(title: '', hintText: ''),
            SizedBox(height: 12 * ratio),
            CustomButton(text: 'Apply', onTap: () {}),
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
            CustomButton(text: _getNextButtonText(), onTap: _goToNextStep),
            SizedBox(height: 12 * ratio),
            CustomButton(text: 'Back', isFilled: false, onTap: _goBack),
            SizedBox(height: 40 * ratio),
          ],
        ),
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
