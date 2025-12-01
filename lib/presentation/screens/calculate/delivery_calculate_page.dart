import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/custom_dropdown.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_main_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class DeliveryCalculatePage extends StatefulWidget {
  const DeliveryCalculatePage({super.key});

  @override
  State<DeliveryCalculatePage> createState() => _DeliveryCalculatePageState();
}

class _DeliveryCalculatePageState extends State<DeliveryCalculatePage> {
  int selectedTabIndex = 1; // 0 = From yours country, 1 = In my country

  // Country/City selections
  String selectedFromCountry = 'United States';
  String selectedToCountry = 'China';
  String selectedFromCity = '';
  String selectedToCity = '';

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
          'Delivery calculate',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        centerTitle: false,
      ),
      body: Column(
        children: [
          // Tab Bar
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
            child: Row(
              children: [
                Expanded(child: _buildTab('From yours country', 0, ratio)),
                SizedBox(width: 20 * ratio),
                Expanded(child: _buildTab('In my country', 1, ratio)),
              ],
            ),
          ),
          SizedBox(height: 30 * ratio),

          // Form Content
          Expanded(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
              child: Column(
                children: [
                  if (selectedTabIndex == 1) ...[
                    // In my country - Country selection
                    CustomDropdown(
                      label: 'From',
                      hint: selectedFromCountry,
                      showFlag: true,
                      flagEmoji: '🇺🇸',
                      onTap: () {
                        // TODO: Show country picker
                      },
                    ),
                    SizedBox(height: 20 * ratio),
                    CustomDropdown(
                      label: 'To',
                      hint: selectedToCountry,
                      showFlag: true,
                      flagEmoji: '🇨🇳',
                      onTap: () {
                        // TODO: Show country picker
                      },
                    ),
                  ] else ...[
                    // From yours country - City selection
                    CustomDropdown(
                      label: 'From',
                      hint: selectedFromCity.isEmpty
                          ? 'Choose your City'
                          : selectedFromCity,
                      onTap: () {
                        // TODO: Show city picker
                      },
                    ),
                    SizedBox(height: 20 * ratio),
                    CustomDropdown(
                      label: 'Where',
                      hint: selectedToCity.isEmpty ? 'To' : selectedToCity,
                      onTap: () {
                        // TODO: Show city picker
                      },
                    ),
                  ],
                  const Spacer(),

                  // Buttons
                  CustomButton(
                    text: 'NEXT',
                    onTap: () {
                      // TODO: Navigate to next step
                    },
                  ),
                  SizedBox(height: 12 * ratio),
                  CustomButton(
                    text: 'CREATE PARCEL',
                    isFilled: false,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CreateParcelMainPage(),
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 40 * ratio),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTab(String title, int index, double ratio) {
    final isSelected = selectedTabIndex == index;
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedTabIndex = index;
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14 * ratio,
              fontWeight: FontWeight.w500,
              color: isSelected ? AppColors.main : Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 8 * ratio),
          Container(
            height: 2 * ratio,
            decoration: BoxDecoration(
              color: isSelected ? AppColors.main : Colors.transparent,
              borderRadius: BorderRadius.circular(2 * ratio),
            ),
          ),
        ],
      ),
    );
  }
}
