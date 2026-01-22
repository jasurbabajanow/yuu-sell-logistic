import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/router/app_router.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/calculate/components/custom_dropdown.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_main_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_country_picker.dart';

class DeliveryCalculatePage extends StatefulWidget {
  const DeliveryCalculatePage({super.key});

  @override
  State<DeliveryCalculatePage> createState() => _DeliveryCalculatePageState();
}

class _DeliveryCalculatePageState extends State<DeliveryCalculatePage> {
  int selectedTabIndex = 1; // 0 = From yours country, 1 = In my country

  Country selected1 = Country(
    phoneCode: "2",
    countryCode: "CN",
    e164Sc: 1,
    geographic: true,
    level: 1,
    name: "China",
    example: "1234567890",
    displayName: "China",
    displayNameNoCountryCode: "China",
    e164Key: "1",
  );
  Country selected2 = Country(
    phoneCode: "1",
    countryCode: "US",
    e164Sc: 1,
    geographic: true,
    level: 1,
    name: "United States",
    example: "1234567890",
    displayName: "United States",
    displayNameNoCountryCode: "United States",
    e164Key: "1",
  );

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
                    CustomCountryPicker(
                      flagEmoji: selected1.flagEmoji,
                      countryName: selected1.name,
                      onTap: () => _showCountryPicker1(context),
                    ),
                    SizedBox(height: 20 * ratio),
                    CustomCountryPicker(
                      flagEmoji: selected2.flagEmoji,
                      countryName: selected2.name,
                      onTap: () => _showCountryPicker2(context),
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
                      if (selectedTabIndex == 1) {
                        context.pushNamed(AppRoutes.deliveryCalculateSub2);
                      } else {
                        context.pushNamed(AppRoutes.deliveryCalculateSub1);
                      }
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

  void _showCountryPicker1(BuildContext context) {
    showCountryPicker(
      favorite: ['TM', 'UZ', 'RU', 'CN'],
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 500, // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withValues(alpha: 0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selected1 = country;
        });
      },
    );
  }

  void _showCountryPicker2(BuildContext context) {
    showCountryPicker(
      favorite: ['TM', 'UZ', 'RU', 'CN'],
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 500, // Optional. Country list modal height
        //Optional. Sets the border radius for the bottomsheet.
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        //Optional. Styles the search field.
        inputDecoration: InputDecoration(
          labelText: 'Search',
          hintText: 'Start typing to search',
          prefixIcon: const Icon(Icons.search),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              color: const Color(0xFF8C98A8).withValues(alpha: 0.2),
            ),
          ),
        ),
      ),
      onSelect: (Country country) {
        setState(() {
          selected2 = country;
        });
      },
    );
  }
}
