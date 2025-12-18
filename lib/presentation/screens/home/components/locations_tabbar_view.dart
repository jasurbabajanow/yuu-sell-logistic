import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/widgets/search_bar_widget.dart';

class LocationsTabbarView extends StatelessWidget {
  const LocationsTabbarView({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return SizedBox(
      height: 600 * ratio,
      child: Column(
        children: [
          SearchBarWidget(),
          SizedBox(height: 12 * ratio),
          Image.asset('assets/images/map.png'),
        ],
      ),
    );
  }
}
