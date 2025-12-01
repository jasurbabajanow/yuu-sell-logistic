import 'package:flutter/material.dart';
import 'package:timelines_plus/timelines_plus.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class HistoryPage extends StatelessWidget {
  const HistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
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
          'History',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        child: ListView.builder(
          itemCount: 10,
          itemBuilder: (context, index) {
            return Padding(
              padding: EdgeInsets.only(bottom: 20),

              child: Container(
                height: 130,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      // ignore: deprecated_member_use
                      color: Color(0xff000000).withOpacity(0.04),
                      spreadRadius: 0,
                      blurRadius: 24,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Air-2025-00124",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text('23.12.2024'),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(22, 12, 22, 0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Ali express",
                            style: AppFontStyles.s12w400(ratio),
                          ),
                          Text(
                            'Bankok to Dubai',
                            style: AppFontStyles.s12w400(ratio),
                          ),
                          Text(
                            "Door-to-door",
                            style: AppFontStyles.s12w400(ratio),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 60,
                      child: Center(
                        child: FixedTimeline.tileBuilder(
                          direction: Axis.horizontal,
                          builder: TimelineTileBuilder.connectedFromStyle(
                            firstConnectorStyle: ConnectorStyle.transparent,
                            lastConnectorStyle: ConnectorStyle.transparent,
                            
                            contentsBuilder: (_, index) {
                              final statuses = [
                                'DXB',
                                'J-Ali',
                                'BND',
                                'ASB',
                                'Получено',
                              ];
                              return Padding(
                                padding: const EdgeInsets.only(bottom: 8.0),
                                child: Text(
                                  statuses[index],
                                  style: AppFontStyles.s12w400(
                                    ratio,
                                  ).copyWith(color: Colors.blue),
                                ),
                              );
                            },
                            itemCount: 5,
                            connectionDirection: ConnectionDirection.after,
                            itemExtent: 74,
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
          },
        ),
      ),
    );
  }
}
