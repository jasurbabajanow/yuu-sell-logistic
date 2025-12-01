import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GeneralSettingsPage extends StatelessWidget {
  const GeneralSettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: Text(
          'General settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Push notification', style: TextStyle(fontSize: 16)),
                SvgPicture.asset('assets/icons/toggle.svg'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Dark mode', style: TextStyle(fontSize: 16)),
                SvgPicture.asset('assets/icons/toggle.svg'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Sound', style: TextStyle(fontSize: 16)),
                SvgPicture.asset('assets/icons/toggle.svg'),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Automatically Updated', style: TextStyle(fontSize: 16)),
                SvgPicture.asset('assets/icons/toggle.svg'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}