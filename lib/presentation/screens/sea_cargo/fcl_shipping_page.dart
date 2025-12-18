import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/air_cargo/payment_method_page.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/calendar_widget.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/components/container_type_bottom_sheet.dart';
import 'package:yuu_sell/presentation/screens/sea_cargo/components/delivery_type_bottom_sheet.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_dropdown_jjj.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class FCLPage extends StatefulWidget {
  const FCLPage({super.key});

  @override
  State<FCLPage> createState() => _FCLPageState();
}

class _FCLPageState extends State<FCLPage> {
  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'FCL Shipping',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0 * ratio,
            vertical: 12 * ratio,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('assets/images/banner.png'),
              SizedBox(height: 12 * ratio),
              CustomDropdown2(label: 'From', hint: 'United States'),
              SizedBox(height: 15 * ratio),
              CustomTextField2(title: 'ZIP Code', hintText: '21002'),
              SizedBox(height: 15 * ratio),
              CustomDropdown2(label: 'To', hint: 'China'),
              SizedBox(height: 15 * ratio),
              CustomDropdown2(
                label: 'Date of shipment',
                hint: 'September, 31',
                onTap: () => _showCalendarPicker(context),
              ),
              SizedBox(height: 15 * ratio),
              CustomDropdown2(
                label: 'Container type:',
                hint: '20ft Standard',
                onTap: () => _showContainerType(context), 
              ),
              SizedBox(height: 15 * ratio),
              CustomTextField2(title: 'HS code', hintText: '022020'),
              SizedBox(height: 15 * ratio),
              CustomDropdown2(
                label: 'Delivery type:',
                hint: 'Door to door',
                onTap: () => _showDeliveryType(context),
              ),
              SizedBox(height: 15 * ratio),
              CustomTextField2(title: 'Commodity description:', hintText: 'Short description'),
              SizedBox(height: 15 * ratio),
              Text(
                "Insurance",
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              CustomTextField2(title: 'Declered Value. \$', hintText: '10.0'),
              SizedBox(height: 8 * ratio),
              Text(
                "Free",
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 48, 231, 31),
                ),
              ),
              SizedBox(height: 15 * ratio),
              CustomButton(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const PaymentMethodPage();
                      },
                    ),
                  );
                },
                text: 'Next',
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showCalendarPicker(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const CalendarRangeBottomSheet(),
    );
  }

  void _showContainerType(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const ContainerTypeBottomSheet(),
    );
  }

  void _showDeliveryType(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const DeliveryTypeBottomSheet(),
    );
  }
}
