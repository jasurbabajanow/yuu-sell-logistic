import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/create_parcel/create_parcel_main_page.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class DeliveryCalculatorDialog extends StatelessWidget {
  final String price;
  final String destination;
  final String parcelSize;
  final String packageWeight;
  final String deliveryType;
  final String shipmentType;
  final VoidCallback onCreateParcel;

  const DeliveryCalculatorDialog({
    super.key,
    required this.price,
    required this.destination,
    required this.parcelSize,
    required this.packageWeight,
    required this.deliveryType,
    required this.shipmentType,
    required this.onCreateParcel,
  });

  // Static method to show the dialog
  static Future<void> show(
    BuildContext context, {
    required String price,
    required String destination,
    required String parcelSize,
    required String packageWeight,
    required String deliveryType,
    required String shipmentType,
    required VoidCallback onCreateParcel,
  }) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return DeliveryCalculatorDialog(
          price: price,
          destination: destination,
          parcelSize: parcelSize,
          packageWeight: packageWeight,
          deliveryType: deliveryType,
          shipmentType: shipmentType,
          onCreateParcel: onCreateParcel,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Container(
        padding: EdgeInsets.all(24 * ratio),
        // constraints: const BoxConstraints(maxWidth: 480),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Title
            Text(
              'Delivery calculator',
              style: AppFontStyles.s24w600(ratio).copyWith(fontSize: 20),
            ),
            SizedBox(height: 16 * ratio),

            // Price
            Text(
              'USD $price',
              style: AppFontStyles.s18w600(
                ratio,
              ).copyWith(color: AppColors.main),
            ),
            SizedBox(height: 20 * ratio),

            // Details
            _buildDetailRow(context, 'Destination:', destination),
            SizedBox(height: 12 * ratio),
            _buildDetailRow(context, 'Parcel size, cm:', parcelSize),
            SizedBox(height: 12 * ratio),
            _buildDetailRow(context, 'Package weight, kg:', packageWeight),
            SizedBox(height: 12 * ratio),
            _buildDetailRow(context, 'Delivery type:', deliveryType),
            SizedBox(height: 12 * ratio),
            _buildDetailRow(context, 'Shipment type:', shipmentType),
            SizedBox(height: 25 * ratio),

            // Create Parcel Button
            CustomButton(
              onTap: () {
                Navigator.of(context).pop();
                onCreateParcel();
              },
              text: 'CREATE PARCEL',
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailRow(BuildContext context, String label, String value) {
    final ratio = AppSizes.ratio(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: AppFontStyles.s16w500(
            ratio,
          ).copyWith(color: AppColors.formDataLabel),
        ),
        const SizedBox(width: 8),
        Expanded(child: Text(value, style: AppFontStyles.s16w500(ratio))),
      ],
    );
  }
}
