import 'package:flutter/material.dart';
import 'package:yuu_sell/presentation/screens/register/components/phone_number_input.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field2.dart';

class PartnershipPage extends StatelessWidget {
  const PartnershipPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'Partnership',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
        child: Column(
          children: [
            CustomTextField2(title: 'Full name', hintText: 'Aman Amanow'),
            SizedBox(height: 20),
            CustomTextField2(
              title: 'Email',
              hintText: 'aman.abc.inc@gmail.com',
            ),
            SizedBox(height: 20),
            PhoneNumberInput(),
            SizedBox(height: 20),
            CustomTextField2(
              title: 'Describe your supports',
              hintText:
                  'I have a four Trucks so we can be partner in my country.',
              maxLines: 5,
            ),
          ],
        ),
      ),
    );
  }
}
