import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_country_picker.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class EconomPage extends StatefulWidget {
  const EconomPage({super.key});

  @override
  State<EconomPage> createState() => _EconomPageState();
}

class _EconomPageState extends State<EconomPage> {
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
          'Econom',
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
              CustomCountryPicker(
                flagEmoji: selected1.flagEmoji,
                countryName: selected1.name,
                onTap: () => _showCountryPicker1(context),
              ),
              SizedBox(height: 15 * ratio),
              CustomTextField2(title: 'ZIP Code', hintText: '21002'),
              SizedBox(height: 15 * ratio),
              CustomCountryPicker(
                flagEmoji: selected2.flagEmoji,
                countryName: selected2.name,
                onTap: () => _showCountryPicker2(context),
              ),
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
              CustomButton(
                onTap: () {
                  context.pushNamed('payment');
                },
                text: 'Next',
              ),
            ],
          ),
        ),
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
              color: const Color(0xFF8C98A8).withOpacity(0.2),
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
              color: const Color(0xFF8C98A8).withOpacity(0.2),
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
