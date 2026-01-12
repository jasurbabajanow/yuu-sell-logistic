import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_steps_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_country_picker.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class CreateParcelMainPage extends StatefulWidget {
  const CreateParcelMainPage({super.key});

  @override
  State<CreateParcelMainPage> createState() => _CreateParcelMainPageState();
}

class _CreateParcelMainPageState extends State<CreateParcelMainPage> {
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
              CustomCountryPicker(
                flagEmoji: selected1.flagEmoji,
                countryName: selected1.name,
                onTap: () => _showCountryPicker1(context),
              ),
              SizedBox(height: 20 * ratio),
              const CustomTextField2(title: 'ZIP code', hintText: '21002'),
              SizedBox(height: 20 * ratio),
              CustomCountryPicker(
                flagEmoji: selected2.flagEmoji,
                countryName: selected2.name,
                onTap: () => _showCountryPicker2(context),
              ),
              // To
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
