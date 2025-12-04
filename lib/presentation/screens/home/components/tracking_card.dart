import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class TrackingCard extends StatelessWidget {
  const TrackingCard({super.key});

  static const List<String> _statuses = [
    'DXB',
    'J-Ali',
    'BND',
    'ASB',
    'Получено',
  ];
  static const BoxDecoration _cardDecoration = BoxDecoration(
    color: Colors.white,
    borderRadius: BorderRadius.all(Radius.circular(10)),
    boxShadow: [
      BoxShadow(
        color: Color(0x0A000000),
        spreadRadius: 0,
        blurRadius: 24,
        offset: Offset(0, 4),
      ),
    ],
  );
  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Container(
        height: 130 * ratio,
        decoration: _cardDecoration,
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(22 * ratio, 12 * ratio, 22 * ratio, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Air-2025-00124",
                    style: TextStyle(fontSize: 16 * ratio, fontWeight: FontWeight.w600),
                  ),
                  Text('23.12.2024'),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(22 * ratio, 12 * ratio, 22 * ratio, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Ali express", style: AppFontStyles.s12w400(ratio)),
                  Text('Bankok to Dubai', style: AppFontStyles.s12w400(ratio)),
                  Text("Door-to-door", style: AppFontStyles.s12w400(ratio)),
                ],
              ),
            ),
            SizedBox(
              height: 60 * ratio,
              child: Center(
                child: FixedTimeline.tileBuilder(
                  theme: TimelineThemeData(
                    color: AppColors.textButton,
                    direction: Axis.horizontal,
                  ),
                  builder: TimelineTileBuilder.connectedFromStyle(
                    firstConnectorStyle: ConnectorStyle.transparent,
                    lastConnectorStyle: ConnectorStyle.transparent,
                    contentsBuilder: (_, index) {
                      return Padding(
                        padding: EdgeInsets.only(bottom: 8.0 * ratio),
                        child: Text(
                          _statuses[index],
                          style: AppFontStyles.s12w400(
                            ratio,
                          ).copyWith(color: AppColors.textButton),
                        ),
                      );
                    },
                    itemCount: 5,
                    connectionDirection: ConnectionDirection.after,
                    itemExtent: 74 * ratio,
                    indicatorStyleBuilder: (_, index) {
                      return (index == 4)
                          ? IndicatorStyle.outlined
                          : IndicatorStyle.dot;
                    },
                    connectorStyleBuilder: (_, index) {
                      return (index == 4)
                          ? ConnectorStyle.dashedLine
                          : ConnectorStyle.solidLine;
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
