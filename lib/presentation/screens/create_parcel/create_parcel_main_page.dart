import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/custom_dropdown.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_steps_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class CreateParcelMainPage extends StatelessWidget {
  const CreateParcelMainPage({super.key});

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
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 20 * ratio),
              // From
              CustomDropdown(
                label: 'From',
                hint: 'United States',
                showFlag: true,
                flagEmoji: '🇺🇸',
                onTap: () {},
              ),
              SizedBox(height: 20 * ratio),
              // ZIP code
              const CustomTextField2(title: 'ZIP code', hintText: '21002'),
              SizedBox(height: 20 * ratio),
              // To
              CustomDropdown(
                label: 'To',
                hint: 'China',
                showFlag: true,
                flagEmoji: '🇨🇳',
                onTap: () {},
              ),
              SizedBox(height: 24 * ratio),
              // Package dimensions
              Text(
                'Package dimensions',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 16 * ratio),
              const CustomTextField2(title: '', hintText: 'Weight lb'),
              SizedBox(height: 12 * ratio),
              const CustomTextField2(title: '', hintText: 'Length in'),
              SizedBox(height: 12 * ratio),
              const CustomTextField2(title: '', hintText: 'Width in'),
              SizedBox(height: 12 * ratio),
              const CustomTextField2(title: '', hintText: 'Height in'),
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
              SizedBox(height: 8 * ratio),
              Text(
                'Declered Value. \$',
                style: TextStyle(
                  fontSize: 14 * ratio,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 12 * ratio),
              const CustomTextField2(title: '', hintText: '01.0'),
              SizedBox(height: 12 * ratio),
              Text(
                'Insurance fee',
                style: TextStyle(
                  fontSize: 14 * ratio,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 4 * ratio),
              Text(
                'Free',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                  color: Colors.green,
                ),
              ),
              SizedBox(height: 40 * ratio),
              // NEXT button
              CustomButton(
                text: 'NEXT',
                onTap: () {
                  // Navigate to step 1
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CreateParcelStepsPage(),
                    ),
                  );
                },
              ),
              SizedBox(height: 40 * ratio),
            ],
          ),
        ),
      ),
    );
  }
}
