import 'package:flutter/material.dart';
import 'package:yuu_sell/presentation/screens/profile/witgets/scaled_switch_button.dart';

class GeneralSettingsPage extends StatefulWidget {
  const GeneralSettingsPage({super.key});

  @override
  State<GeneralSettingsPage> createState() => _GeneralSettingsPageState();
}

class _GeneralSettingsPageState extends State<GeneralSettingsPage> {
  bool _pushNotification = false;
  bool _darkMode = false;
  bool _sound = false;
  bool _autoUpdate = false;

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
          'General settings',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Push notification', style: TextStyle(fontSize: 16)),
                ScaledSwitchButton(
                  value: _pushNotification,
                  onChanged: (val) {
                    setState(() {
                      _pushNotification = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark mode', style: TextStyle(fontSize: 16)),
                ScaledSwitchButton(
                  value: _darkMode,
                  onChanged: (val) {
                    setState(() {
                      _darkMode = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Sound', style: TextStyle(fontSize: 16)),
                ScaledSwitchButton(
                  value: _sound,
                  onChanged: (val) {
                    setState(() {
                      _sound = val;
                    });
                  },
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Automatically Updated', style: TextStyle(fontSize: 16)),
                ScaledSwitchButton(
                  value: _autoUpdate,
                  onChanged: (val) {
                    setState(() {
                      _autoUpdate = val;
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
