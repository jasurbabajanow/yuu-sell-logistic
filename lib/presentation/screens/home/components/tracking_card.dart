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

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      padding: EdgeInsets.all(16 * ratio),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12 * ratio),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'AIR-2025-00124',
                style: TextStyle(
                  fontSize: 16 * ratio,
                  fontWeight: FontWeight.w600,
                  color: Colors.black,
                ),
              ),
              Text(
                '23.12.2024',
                style: TextStyle(
                  fontSize: 14 * ratio,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey.shade600,
                ),
              ),
            ],
          ),
          SizedBox(height: 8 * ratio),
          // Details
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'All express',
                style: AppFontStyles.s12w400(
                  ratio,
                ).copyWith(color: Colors.grey.shade600),
              ),
              Text(
                'Bankok to Dubai',
                style: AppFontStyles.s12w400(
                  ratio,
                ).copyWith(color: Colors.grey.shade600),
              ),
              Text(
                'Door-to-door',
                style: AppFontStyles.s12w400(
                  ratio,
                ).copyWith(color: Colors.grey.shade600),
              ),
            ],
          ),
          SizedBox(height: 16 * ratio),
          // Timeline
          SizedBox(
            height: 60 * ratio,
            child: LayoutBuilder(
              builder: (context, constraints) {
                final itemWidth = (constraints.maxWidth - 40) / 5;
                return Center(
                  child: FixedTimeline.tileBuilder(
                    theme: TimelineThemeData(
                      color: AppColors.main,
                      direction: Axis.horizontal,
                    ),
                    builder: TimelineTileBuilder.connectedFromStyle(
                      firstConnectorStyle: ConnectorStyle.transparent,
                      lastConnectorStyle: ConnectorStyle.transparent,
                      contentsBuilder: (_, index) {
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 8.0),
                          child: Text(
                            _statuses[index],
                            style: AppFontStyles.s12w400(
                              ratio,
                            ).copyWith(color: AppColors.main),
                          ),
                        );
                      },
                      itemCount: 5,
                      connectionDirection: ConnectionDirection.after,
                      itemExtent: itemWidth,
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
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
