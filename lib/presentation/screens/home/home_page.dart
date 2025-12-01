import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.white,
      floatingActionButton: SizedBox(
        width: 60 * ratio,
        height: 60 * ratio,
        child: FloatingActionButton(
          backgroundColor: AppColors.main,
          shape: CircleBorder(),
          onPressed: () {},
          child: SvgPicture.asset('assets/icons/calculator.svg'),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(children: [Center(child: Text('Home page'))]),
      ),
    );
  }
}
