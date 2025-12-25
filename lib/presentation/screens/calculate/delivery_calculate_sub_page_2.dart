import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/delivery_calculate_dialog.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_main_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_dropdown_jjj.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class DeliveryCalculateSubPage2 extends StatefulWidget {
  const DeliveryCalculateSubPage2({super.key});

  @override
  State<DeliveryCalculateSubPage2> createState() =>
      _DeliveryCalculateSubPage2State();
}

class _DeliveryCalculateSubPage2State extends State<DeliveryCalculateSubPage2> {
  String selectedUnit = 'inch';
  String selectedWeightUnit = 'lbs';

  final TextEditingController lengthController = TextEditingController();
  final TextEditingController widthController = TextEditingController();
  final TextEditingController heightController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  @override
  void dispose() {
    lengthController.dispose();
    widthController.dispose();
    heightController.dispose();
    weightController.dispose();
    super.dispose();
  }

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
      body: Container(
        padding: EdgeInsets.symmetric(
          horizontal: 20 * ratio,
          vertical: 12 * ratio,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CustomTextField2(title: 'zip code', hintText: '20001'),
            SizedBox(height: 15),
            // Unit toggle buttons
            Row(
              children: [
                Expanded(
                  child: _buildToggleButton('cm', selectedUnit == 'cm', () {
                    setState(() {
                      selectedUnit = 'cm';
                    });
                  }),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildToggleButton('inch', selectedUnit == 'inch', () {
                    setState(() {
                      selectedUnit = 'inch';
                    });
                  }),
                ),
              ],
            ),
            const SizedBox(height: 16),

            // Dimension fields
            Row(
              children: [
                Expanded(child: _buildTextField('Length', lengthController)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField('Width', widthController)),
                const SizedBox(width: 12),
                Expanded(child: _buildTextField('Height', heightController)),
              ],
            ),
            const SizedBox(height: 16),

            // Package weight label
            const Text(
              'Package weight, lbs',
              style: TextStyle(fontSize: 14, color: Colors.black87),
            ),
            const SizedBox(height: 8),

            // Weight field with unit toggle
            Row(
              children: [
                Expanded(child: _buildTextField('', weightController)),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildSmallToggleButton(
                    'kg',
                    selectedWeightUnit == 'kg',
                    () {
                      setState(() {
                        selectedWeightUnit = 'kg';
                      });
                    },
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: _buildSmallToggleButton(
                    'lbs',
                    selectedWeightUnit == 'lbs',
                    () {
                      setState(() {
                        selectedWeightUnit = 'lbs';
                      });
                    },
                  ),
                ),
              ],
            ),
            SizedBox(height: 15 * ratio),
            CustomDropdown2(label: 'Delivery type', hint: 'Door'),
            SizedBox(height: 15 * ratio),
            CustomDropdown2(label: 'Shipment type', hint: 'Parcel(box)'),
            Spacer(),
            CustomButton(
              onTap: () {
                DeliveryCalculatorDialog.show(
                  context,
                  price: '\$136.71',
                  destination: 'China > USA, Alabama',
                  parcelSize: '12x12x12',
                  packageWeight: '12',
                  deliveryType: 'Door',
                  shipmentType: 'Correspondence (package)',
                  onCreateParcel: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateParcelMainPage(),
                      ),
                    );
                    print('Create parcel clicked');
                  },
                );
              },
              text: 'CALCULATE',
            ),
            SizedBox(height: 10 * ratio),
            CustomButton(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => CreateParcelMainPage(),
                  ),
                );
              },
              text: 'CREATE PARCEL',
              isFilled: false,
            ),
            SizedBox(height: 40 * ratio),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String text, bool isSelected, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 10),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.main : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.main : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: isSelected ? Colors.white : Colors.grey.shade600,
              fontSize: 15,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSmallToggleButton(
    String text,
    bool isSelected,
    VoidCallback onTap,
  ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.main : Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? AppColors.main : Colors.grey.shade300,
            width: 1,
          ),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.grey.shade600,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }

  Widget _buildTextField(String hint, TextEditingController controller) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.grey.shade400, fontSize: 14),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: Colors.grey.shade300),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: AppColors.main),
        ),
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
      ),
    );
  }
}
