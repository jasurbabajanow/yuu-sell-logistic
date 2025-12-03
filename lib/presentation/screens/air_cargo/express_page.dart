import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_dropdown_jjj.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class ExpressPage extends StatefulWidget {
  const ExpressPage({super.key});

  @override
  State<ExpressPage> createState() => _ExpressPageState();
}

class _ExpressPageState extends State<ExpressPage> {
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
          'Express',
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
              CustomTextField2(
                title: 'Package dimension',
                hintText: 'weight lb',
              ),
              CustomTextField2(title: '', hintText: 'length inc'),
              CustomTextField2(title: '', hintText: 'width inc'),
              CustomTextField2(title: '', hintText: 'height inc'),
              SizedBox(height: 15 * ratio),
              Text(
                "Insurance",
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
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
              CustomButton(onTap: () {}, text: 'Next'),
            ],
          ),
        ),
      ),
    );
  }
}
