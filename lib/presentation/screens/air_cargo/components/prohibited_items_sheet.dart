import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';

class ProhibitedItemsSheet extends StatelessWidget {
  const ProhibitedItemsSheet({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Container(
      padding: EdgeInsets.only(
        left: 20 * ratio,
        right: 20 * ratio,
        top: 20 * ratio,
        bottom: MediaQuery.of(context).viewInsets.bottom + 40 * ratio,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20 * ratio),
          topRight: Radius.circular(20 * ratio),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/item1.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Explosives and Ammunition',
                        style: AppFontStyles.s14w600(ratio),
                      ),
                      Text(
                        'PLEASE CHECK DESTINATION COUNTRY\nRESTRICTIONS FOR INCOMING SHIPMENTS',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(fontSize: 10, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/item2.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Culture and Natural Assets',
                        style: AppFontStyles.s14w600(ratio),
                      ),
                      Text(
                        'PLEASE CHECK DESTINATION COUNTRY\nRESTRICTIONS FOR INCOMING SHIPMENTS',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(fontSize: 10, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/item3.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Perishable Goods and Biological Materials',
                        style: AppFontStyles.s14w600(ratio),
                      ),
                      Text(
                        'PLEASE CHECK DESTINATION COUNTRY\nRESTRICTIONS FOR INCOMING SHIPMENTS',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(fontSize: 10, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/item4.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Lithium Batteries (in some cases)',
                        style: AppFontStyles.s14w600(ratio),
                      ),
                      Text(
                        'PLEASE CHECK DESTINATION COUNTRY\nRESTRICTIONS FOR INCOMING SHIPMENTS',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(fontSize: 10, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 22 * ratio),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20 * ratio),
              boxShadow: [
                BoxShadow(
                  color: Color(0xff000000).withOpacity(0.05),
                  blurRadius: 14,
                  spreadRadius: 0,
                  offset: Offset(0, 9),
                ),
              ],
            ),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.all(12.0 * ratio),
                  child: SvgPicture.asset('assets/icons/item5.svg'),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Radioactive Materials',
                        style: AppFontStyles.s14w600(ratio),
                      ),
                      Text(
                        'PLEASE CHECK DESTINATION COUNTRY\nRESTRICTIONS FOR INCOMING SHIPMENTS',
                        style: AppFontStyles.s12w500(
                          ratio,
                        ).copyWith(fontSize: 10, color: Colors.red),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
