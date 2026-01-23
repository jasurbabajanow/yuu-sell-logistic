import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/providers/create_parcel_provider.dart';
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
  late Country _originCountry;
  late Country _destinationCountry;

  final _zipCodeController = TextEditingController();
  final _weightController = TextEditingController();
  final _lengthController = TextEditingController();
  final _widthController = TextEditingController();
  final _heightController = TextEditingController();
  final _declaredValueController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _originCountry = Country(
      phoneCode: "86",
      countryCode: "CN",
      e164Sc: 1,
      geographic: true,
      level: 1,
      name: "China",
      example: "1234567890",
      displayName: "China",
      displayNameNoCountryCode: "China",
      e164Key: "86",
    );
    _destinationCountry = Country(
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
  }

  @override
  void dispose() {
    _zipCodeController.dispose();
    _weightController.dispose();
    _lengthController.dispose();
    _widthController.dispose();
    _heightController.dispose();
    _declaredValueController.dispose();
    super.dispose();
  }

  void _saveDataAndNavigate() {
    final provider = context.read<CreateParcelProvider>();

    // Save origin/destination
    provider.setOriginCountry(_originCountry.name, _originCountry.countryCode);
    provider.setOriginZipCode(_zipCodeController.text);
    provider.setDestinationCountry(
      _destinationCountry.name,
      _destinationCountry.countryCode,
    );

    // Save package dimensions
    provider.setWeight(double.tryParse(_weightController.text) ?? 0.0);
    provider.setLength(double.tryParse(_lengthController.text) ?? 0.0);
    provider.setWidth(double.tryParse(_widthController.text) ?? 0.0);
    provider.setHeight(double.tryParse(_heightController.text) ?? 0.0);

    // Save insurance
    provider.setDeclaredValue(
      double.tryParse(_declaredValueController.text) ?? 0.0,
    );

    // Navigate to steps page
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CreateParcelStepsPage(),
      ),
    );
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
          onPressed: () {
            context.read<CreateParcelProvider>().reset();
            Navigator.pop(context);
          },
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
                flagEmoji: _originCountry.flagEmoji,
                countryName: _originCountry.name,
                onTap: () => _showCountryPicker(
                  context,
                  isOrigin: true,
                ),
              ),
              SizedBox(height: 20 * ratio),
              CustomTextField2(
                title: 'ZIP code',
                hintText: '21002',
                controller: _zipCodeController,
                keyboardType: TextInputType.text,
              ),
              SizedBox(height: 20 * ratio),
              CustomCountryPicker(
                flagEmoji: _destinationCountry.flagEmoji,
                countryName: _destinationCountry.name,
                onTap: () => _showCountryPicker(
                  context,
                  isOrigin: false,
                ),
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
              CustomTextField2(
                title: '',
                hintText: 'Weight lb',
                controller: _weightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 12 * ratio),
              CustomTextField2(
                title: '',
                hintText: 'Length in',
                controller: _lengthController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 12 * ratio),
              CustomTextField2(
                title: '',
                hintText: 'Width in',
                controller: _widthController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
              SizedBox(height: 12 * ratio),
              CustomTextField2(
                title: '',
                hintText: 'Height in',
                controller: _heightController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
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
                'Declared Value. \$',
                style: TextStyle(
                  fontSize: 14 * ratio,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
              SizedBox(height: 12 * ratio),
              CustomTextField2(
                title: '',
                hintText: '01.0',
                controller: _declaredValueController,
                keyboardType: TextInputType.numberWithOptions(decimal: true),
              ),
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
                onTap: _saveDataAndNavigate,
              ),
              SizedBox(height: 40 * ratio),
            ],
          ),
        ),
      ),
    );
  }

  void _showCountryPicker(BuildContext context, {required bool isOrigin}) {
    showCountryPicker(
      favorite: ['TM', 'UZ', 'RU', 'CN'],
      context: context,
      countryListTheme: CountryListThemeData(
        flagSize: 25,
        backgroundColor: Colors.white,
        textStyle: TextStyle(fontSize: 16, color: Colors.blueGrey),
        bottomSheetHeight: 500,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
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
          if (isOrigin) {
            _originCountry = country;
          } else {
            _destinationCountry = country;
          }
        });
      },
    );
  }
}
