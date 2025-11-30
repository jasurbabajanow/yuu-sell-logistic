import 'dart:async';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/register/components/custom_back_button.dart';

class OtpPage extends StatefulWidget {
  const OtpPage({super.key});

  @override
  State<OtpPage> createState() => _OtpPageState();
}

class _OtpPageState extends State<OtpPage> {
  Timer? _timer;
  int _secondsRemaining = 60;

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _secondsRemaining = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsRemaining > 0) {
        setState(() {
          _secondsRemaining--;
        });
      } else {
        _timer?.cancel();
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  String _formatTime(int seconds) {
    int minutes = seconds ~/ 60;
    int remainingSeconds = seconds % 60;
    return '${minutes.toString().padLeft(2, '0')}:${remainingSeconds.toString().padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30 * ratio),
          child: Column(
            children: [
              SizedBox(height: 78 * ratio),
              Row(
                children: [
                  CustomBackButton(),
                  SizedBox(width: 65 * ratio),
                  Text(
                    'Verification',
                    style: AppFontStyles.s24w600(
                      ratio,
                    ).copyWith(letterSpacing: 2),
                  ),
                ],
              ),
              SizedBox(height: 100 * ratio),
              Text(
                'Code has been send to (+1) 325 **** *6789',
                style: AppFontStyles.s16w500(ratio),
              ),
              SizedBox(height: 100 * ratio),
              Pinput(length: 4),
              const Spacer(),
              if (_secondsRemaining > 0)
                Text(
                  'Resend code in ${_formatTime(_secondsRemaining)}',
                  style: AppFontStyles.s12w600(
                    ratio,
                  ).copyWith(color: AppColors.textFieldBorder),
                )
              else
                TextButton(
                  onPressed: _startTimer,
                  child: Text(
                    'Resend Code',
                    style: AppFontStyles.s12w600(
                      ratio,
                    ).copyWith(color: AppColors.main),
                  ),
                ),
              SizedBox(height: 40 * ratio),
            ],
          ),
        ),
      ),
    );
  }
}
