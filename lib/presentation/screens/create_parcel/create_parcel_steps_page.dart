import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/data/models/order_item_model.dart';
import 'package:yuu_sell/presentation/providers/auth_provider.dart';
import 'package:yuu_sell/presentation/providers/create_parcel_provider.dart';
import 'package:yuu_sell/presentation/providers/order_provider.dart';
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
  int currentStep = 1;

  // Sender controllers
  final _senderFirstNameController = TextEditingController();
  final _senderLastNameController = TextEditingController();
  final _senderEmailController = TextEditingController();
  final _senderPhoneController = TextEditingController();
  final _senderAddressController = TextEditingController();
  final _senderCityController = TextEditingController();
  final _senderStateController = TextEditingController();
  final _senderZipCodeController = TextEditingController();

  // Receiver controllers
  final _receiverFirstNameController = TextEditingController();
  final _receiverLastNameController = TextEditingController();
  final _receiverEmailController = TextEditingController();
  final _receiverPhoneController = TextEditingController();
  final _receiverAddressController = TextEditingController();
  final _receiverCityController = TextEditingController();
  final _receiverStateController = TextEditingController();
  final _receiverZipCodeController = TextEditingController();

  // Promo code controller
  final _promoCodeController = TextEditingController();

  @override
  void dispose() {
    _senderFirstNameController.dispose();
    _senderLastNameController.dispose();
    _senderEmailController.dispose();
    _senderPhoneController.dispose();
    _senderAddressController.dispose();
    _senderCityController.dispose();
    _senderStateController.dispose();
    _senderZipCodeController.dispose();
    _receiverFirstNameController.dispose();
    _receiverLastNameController.dispose();
    _receiverEmailController.dispose();
    _receiverPhoneController.dispose();
    _receiverAddressController.dispose();
    _receiverCityController.dispose();
    _receiverStateController.dispose();
    _receiverZipCodeController.dispose();
    _promoCodeController.dispose();
    super.dispose();
  }

  void _saveSenderInfo() {
    final provider = context.read<CreateParcelProvider>();
    provider.setSenderFirstName(_senderFirstNameController.text);
    provider.setSenderLastName(_senderLastNameController.text);
    provider.setSenderEmail(_senderEmailController.text);
    provider.setSenderPhone(_senderPhoneController.text);
    provider.setSenderAddress(_senderAddressController.text);
    provider.setSenderCity(_senderCityController.text);
    provider.setSenderState(_senderStateController.text);
    provider.setSenderZipCode(_senderZipCodeController.text);
  }

  void _saveReceiverInfo() {
    final provider = context.read<CreateParcelProvider>();
    provider.setReceiverFirstName(_receiverFirstNameController.text);
    provider.setReceiverLastName(_receiverLastNameController.text);
    provider.setReceiverEmail(_receiverEmailController.text);
    provider.setReceiverPhone(_receiverPhoneController.text);
    provider.setReceiverAddress(_receiverAddressController.text);
    provider.setReceiverCity(_receiverCityController.text);
    provider.setReceiverState(_receiverStateController.text);
    provider.setReceiverZipCode(_receiverZipCodeController.text);
  }

  void _goToNextStep() {
    if (currentStep == 2) {
      _saveSenderInfo();
    } else if (currentStep == 3) {
      _saveReceiverInfo();
    }

    if (currentStep < 4) {
      setState(() {
        currentStep++;
      });
    } else {
      _submitOrder();
    }
  }

  void _goBack() {
    if (currentStep == 2) {
      _saveSenderInfo();
    } else if (currentStep == 3) {
      _saveReceiverInfo();
    }

    if (currentStep > 1) {
      setState(() {
        currentStep--;
      });
    } else {
      Navigator.pop(context);
    }
  }

  Future<void> _submitOrder() async {
    final parcelProvider = context.read<CreateParcelProvider>();
    final orderProvider = context.read<OrderProvider>();
    final authProvider = context.read<AuthProvider>();

    // Save promo code
    parcelProvider.setPromoCode(_promoCodeController.text);

    // Get client ID from auth provider (user ID)
    final clientId = int.tryParse(authProvider.user?.id ?? '0') ?? 0;

    // Create order item
    final orderItem = OrderItemModel(
      type: 'general',
      description: 'Parcel shipment',
      qty: 1,
      weightKg: parcelProvider.weight * 0.453592, // Convert lb to kg
      volumeM3: parcelProvider.volume,
      lengthCm: parcelProvider.length * 2.54, // Convert in to cm
      widthCm: parcelProvider.width * 2.54,
      heightCm: parcelProvider.height * 2.54,
    );

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    // Submit order
    final success = await orderProvider.createOrder(
      items: [orderItem],
      clientId: clientId,
      originPoint: parcelProvider.originPoint,
      destinationPoint: parcelProvider.destinationPoint,
      cargoType: 'general',
      weight: parcelProvider.weight * 0.453592, // Convert lb to kg
      volume: parcelProvider.volume,
      deliveryCost: parcelProvider.deliveryCost,
    );

    // Hide loading indicator
    if (mounted) {
      Navigator.pop(context);
    }

    if (success) {
      // Reset form and navigate to payment/success
      parcelProvider.reset();
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Order created successfully!'),
            backgroundColor: Colors.green,
          ),
        );
        context.pushNamed('payment');
      }
    } else {
      // Show error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(orderProvider.errorMessage ?? 'Failed to create order'),
            backgroundColor: Colors.red,
          ),
        );
      }
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
    final provider = context.watch<CreateParcelProvider>();
    return currentStep == 4
        ? 'Pay (${provider.deliveryCost.toStringAsFixed(2)}\$)'
        : 'Next';
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
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
            child: StepProgressBar(currentStep: currentStep),
          ),
          SizedBox(height: 24 * ratio),
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
    final provider = context.watch<CreateParcelProvider>();

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
            GestureDetector(
              onTap: () {
                provider.setSelectedDeliveryOption(0);
                provider.setDeliveryCost(14.50);
                provider.setDeliveryTime('1-4 days');
              },
              child: DeliveryServiceCard(
                badgeText: 'Best price',
                badgeColor: Colors.green,
                price: '14.50\$',
                deliveryTime: '1-4 days',
                showPrintLabel: true,
                isSelected: provider.selectedDeliveryOption == 0,
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setSelectedDeliveryOption(1);
                provider.setDeliveryCost(24.50);
                provider.setDeliveryTime('1-2 days');
              },
              child: DeliveryServiceCard(
                badgeText: 'Fastest',
                badgeColor: Colors.pink,
                price: '24.50\$',
                deliveryTime: '1-2 days',
                isSelected: provider.selectedDeliveryOption == 1,
              ),
            ),
            GestureDetector(
              onTap: () {
                provider.setSelectedDeliveryOption(2);
                provider.setDeliveryCost(19.50);
                provider.setDeliveryTime('2-3 days');
              },
              child: DeliveryServiceCard(
                badgeText: 'Standard',
                badgeColor: Colors.blue,
                price: '19.50\$',
                deliveryTime: '2-3 days',
                showPrintLabel: true,
                isSelected: provider.selectedDeliveryOption == 2,
              ),
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
    final provider = context.watch<CreateParcelProvider>();

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
            CustomTextField2(
              title: '',
              hintText: 'Full name / Company name',
              controller: _senderFirstNameController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Last name',
              controller: _senderLastNameController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Email',
              controller: _senderEmailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Phone number',
              controller: _senderPhoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Address',
              controller: _senderAddressController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'City',
              controller: _senderCityController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'State',
              controller: _senderStateController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Zip code',
              controller: _senderZipCodeController,
            ),
            SizedBox(height: 24 * ratio),
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
                      provider.deliveryTime,
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
                  '${provider.deliveryCost.toStringAsFixed(2)}\$',
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
    final provider = context.watch<CreateParcelProvider>();

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
            CustomTextField2(
              title: '',
              hintText: 'Full name / Company name',
              controller: _receiverFirstNameController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Last name',
              controller: _receiverLastNameController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Email',
              controller: _receiverEmailController,
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Phone number',
              controller: _receiverPhoneController,
              keyboardType: TextInputType.phone,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Address',
              controller: _receiverAddressController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'City',
              controller: _receiverCityController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'State',
              controller: _receiverStateController,
            ),
            SizedBox(height: 12 * ratio),
            CustomTextField2(
              title: '',
              hintText: 'Zip code',
              controller: _receiverZipCodeController,
            ),
            SizedBox(height: 24 * ratio),
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
                      provider.deliveryTime,
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
                  '${provider.deliveryCost.toStringAsFixed(2)}\$',
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
    final provider = context.watch<CreateParcelProvider>();

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
              '${provider.originCountry}, ${provider.originZipCode}, ${provider.senderCity}',
              ratio,
            ),
            SizedBox(height: 8 * ratio),
            _buildDetailText('To', ratio),
            _buildValueText(
              '${provider.destinationCountry}, ${provider.receiverZipCode}, ${provider.receiverCity}',
              ratio,
            ),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Weight', ratio),
            _buildValueText('${provider.weight.toStringAsFixed(1)} lb', ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Dimensions', ratio),
            _buildValueText(provider.dimensionsString, ratio),
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
            _buildValueText(provider.senderFullName, ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Phone number', ratio),
            _buildValueText(provider.senderPhone, ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Email', ratio),
            _buildValueText(provider.senderEmail, ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Pick up details', ratio),
            _buildValueText(provider.senderFullAddress, ratio),
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
            _buildValueText(provider.receiverFullName, ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Phone number', ratio),
            _buildValueText(provider.receiverPhone, ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Email', ratio),
            _buildValueText(provider.receiverEmail, ratio),
            SizedBox(height: 8 * ratio),
            _buildDetailText('Delivery details', ratio),
            _buildValueText(provider.receiverFullAddress, ratio),
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
            CustomTextField2(
              title: '',
              hintText: 'Enter promo code',
              controller: _promoCodeController,
            ),
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
                  '${provider.declaredValue.toStringAsFixed(2)}\$',
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
                      provider.deliveryTime,
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
                  '${provider.deliveryCost.toStringAsFixed(2)}\$',
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
      text.isEmpty ? '-' : text,
      style: TextStyle(
        fontSize: 16 * ratio,
        fontWeight: FontWeight.w600,
        color: Colors.black,
      ),
    );
  }
}
