import 'package:flutter/material.dart';
import 'package:yuu_sell/presentation/screens/profile/witgets/scaled_switch_button.dart';

class SecurityPage extends StatefulWidget {
  const SecurityPage({super.key});

  @override
  State<SecurityPage> createState() => _SecurityPageState();
}

class _SecurityPageState extends State<SecurityPage> {
  bool _touchId = false;
  bool _pinSecurity = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        centerTitle: true,
        title: const Text(
          'Security',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 30),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Touch ID', style: TextStyle(fontSize: 16)),
                ScaledSwitchButton(
                  value: _touchId,
                  onChanged: (val) {
                    setState(() {
                      _touchId = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Pin security', style: TextStyle(fontSize: 16)),
                ScaledSwitchButton(
                  value: _pinSecurity,
                  onChanged: (val) {
                    setState(() {
                      _pinSecurity = val;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
