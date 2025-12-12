import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shimmer/shimmer.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/screens/home/components/tracking_card.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/search_bar_widget.dart';

class TruckPage extends StatelessWidget {
  const TruckPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            SvgPicture.asset(
              'assets/images/dump_map.svg',
              fit: BoxFit.fitHeight,
              placeholderBuilder: (context) => Shimmer.fromColors(
                baseColor: Colors.grey.shade300,
                highlightColor: Colors.grey.shade100,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ),
            Positioned(
              top: 62 * ratio,
              left: 16 * ratio,
              right: 16 * ratio,
              child: SearchBarWidget(),
            ),
            Positioned(
              top: 360 * ratio,
              left: 230 * ratio,
              child: SvgPicture.asset(
                'assets/icons/location_mark.svg',
                placeholderBuilder: (context) => Shimmer.fromColors(
                  baseColor: Colors.grey.shade300,
                  highlightColor: Colors.grey.shade100,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 60 * ratio,
              left: 16 * ratio,
              right: 16 * ratio,
              child: TrackingCard(title: 'TRUCK-2025-00124'),
            ),
            Positioned(
              bottom: 20 * ratio,
              left: 16 * ratio,
              right: 16 * ratio,
              child: CustomButton(onTap: () {}, text: "Track Shipment"),
            ),
          ],
        ),
      ),
    );
  }
}
