import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class YuuSellPayment extends StatelessWidget {
  const YuuSellPayment({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Yuusell payment', style: AppFontStyles.s18w600(ratio)),
      ),
    );
  }
}
