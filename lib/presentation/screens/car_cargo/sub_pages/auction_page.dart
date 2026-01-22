import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/calendar_widget.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/deliver_info_widget.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/most_have_document_sheet.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/payment_sheet_widget.dart';
import 'package:yuu_sell/presentation/screens/car_cargo/widgets/plain_bottom_sheet.dart';
import 'package:yuu_sell/presentation/widgets/custom_country_picker.dart';
import 'package:yuu_sell/presentation/widgets/custom_dropdown_jjj.dart';

class AuctionPage extends StatefulWidget {
  const AuctionPage({super.key});

  @override
  State<AuctionPage> createState() => _AuctionPageState();
}

class _AuctionPageState extends State<AuctionPage> {
  String? selectedCategory;
  String? selectedPickup;
  String? selectedConsignee;
  String? selectedCarInfo;
  String? selectedDocuments;
  String? selectedPickupDate;
  String? selectedToDate;
  Country selected = Country(
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
  int insuranceValue = 10;

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Auction',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(
            left: 20.0 * ratio,
            right: 20.0 * ratio,
            bottom: 20 * ratio,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header Card
              Image.asset('assets/images/banner.png'),
              SizedBox(height: 15 * ratio),

              // Category of shipment
              CustomDropdown2(
                label: 'Auctions',
                hint: 'Copart',
                onTap: () => _showAuctionSheet(context),
              ),
              SizedBox(height: 15 * ratio),
              // Pick up from
              CustomCountryPicker(
                flagEmoji: selected.flagEmoji,
                countryName: selected.name,
                onTap: () => _showCountryPicker(context),
              ),
              SizedBox(height: 15 * ratio),

              CustomDropdown2(
                label: 'State',
                hint: 'Alabama',
                onTap: () => _showStateSheet(context),
              ),
              SizedBox(height: 15 * ratio),

              CustomDropdown2(
                label: 'Branch',
                hint: 'Tanner',
                onTap: () => _showBranchSheet(context),
              ),
              SizedBox(height: 15 * ratio),

              CustomDropdown2(
                label: 'Status',
                hint: 'Roll-on',
                onTap: () => _showStatusSheet(context),
              ),
              SizedBox(height: 15 * ratio),

              // // Consignee
              // CustomDropdown2(
              //   label: 'Consignee',
              //   hint: 'Information of reciver',
              // ),
              // SizedBox(height: 15 * ratio),

              // // Information of car
              // CustomDropdown2(
              //   label: 'Information of car',
              //   hint: 'Information of car',
              //   onTap: () => _showCarInfoSheet(context),
              // ),
              // SizedBox(height: 15 * ratio),

              // Drop here car photos
              Text(
                "Drop here car photos (10 picture)",
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8 * ratio),
              Container(
                height: 80 * ratio,
                width: 80 * ratio,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.grey.shade300),
                  borderRadius: BorderRadius.circular(8 * ratio),
                ),
                child: Center(
                  child: Icon(
                    Icons.add,
                    color: Colors.grey.shade400,
                    size: 24 * ratio,
                  ),
                ),
              ),
              SizedBox(height: 16 * ratio),

              // Most have documents
              CustomDropdown2(
                label: 'Most have documents',
                hint: 'Drop here',
                onTap: () => _showMostHaveDocumentsSheet(context),
              ),
              SizedBox(height: 15 * ratio),

              // Date of pick up
              CustomDropdown2(
                label: 'Date of pick up',
                hint: 'September, 31',
                onTap: () => _showCalendarPicker(context),
              ),

              SizedBox(height: 15 * ratio),
              CustomDropdown2(
                label: 'Deliver information',
                hint: 'Dubai',
                onTap: () => _showDeliverInfoSheet(context),
              ),

              SizedBox(height: 16 * ratio),
              Text(
                "Insurance",
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              // Insurance
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Declared Value, \$',
                    style: TextStyle(color: Colors.grey, fontSize: 14 * ratio),
                  ),
                  Text(
                    '$insuranceValue\$',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 16 * ratio,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 24),

              // Next Button
              SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    _showPaymentSheet(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 12, 62, 245),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    elevation: 0,
                  ),
                  child: const Text(
                    'NEXT',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  void _showAuctionSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlainBottomSheet(
        items: ['Copart', 'IAAI', 'MANHEIM', 'SALVAGENOV', 'Other'],
      ),
    );
  }

  // void _showCountrySheet(BuildContext context) {
  //   showModalBottomSheet(
  //     context: context,
  //     isScrollControlled: true,
  //     backgroundColor: Colors.transparent,
  //     builder: (context) =>
  //         PlainBottomSheet(items: ['USA', 'ITALY', 'RUSSIA', 'UKRAINE', 'UAE']),
  //   );
  // }

  void _showStateSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlainBottomSheet(
        items: ['Texas', 'California', 'Alabama', 'UKRAINE', 'Florida'],
      ),
    );
  }

  void _showBranchSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlainBottomSheet(
        items: ['Athens', 'Birmingham', 'Attala', 'Bessemel', 'Tanner'],
      ),
    );
  }

  void _showStatusSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => PlainBottomSheet(items: ['Roll-on', 'Roll-off']),
    );
  }

  void _showDeliverInfoSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const DeliverInfoWidget(),
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

  void _showPaymentSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const PaymentSheetWidget(),
    );
  }

  void _showMostHaveDocumentsSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const MostHaveDocumentsSheetWidget(),
    );
  }

  void _showCountryPicker(BuildContext context) {
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
          selected = country;
        });
      },
    );
  }
}
