import 'package:flutter/material.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class MessageDetailsPage extends StatelessWidget {
  const MessageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          color: Colors.black,
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text(
          'Details',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 24 * ratio),
            // Details list
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    _buildDetailItem('Tracking number', 'AIR-00045', ratio),
                    _buildDetailItem('Sender', 'Ali Express', ratio),
                    _buildDetailItem('Receiver', 'John Doe', ratio),
                    _buildDetailItem('Route', 'Bangkok → Dubai', ratio),
                    _buildDetailItem('Shipment type', 'Air Cargo', ratio),
                    _buildDetailItem('Delivery type', 'Door-to-Door', ratio),
                    _buildDetailItem('Status', 'In Transit', ratio),
                    _buildDetailItem('Last update', '2025-10-09', ratio),
                  ],
                ),
              ),
            ),
            // Bottom section
            Container(
              padding: EdgeInsets.symmetric(vertical: 16 * ratio),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Delivery from warehouse',
                        style: TextStyle(
                          fontSize: 14 * ratio,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Row(
                        children: [
                          Text(
                            '1-4 days',
                            style: TextStyle(
                              fontSize: 14 * ratio,
                              fontWeight: FontWeight.w400,
                              color: Colors.grey.shade600,
                            ),
                          ),
                          SizedBox(width: 8 * ratio),
                          Icon(
                            Icons.local_shipping_outlined,
                            size: 20 * ratio,
                            color: Colors.grey.shade600,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 16 * ratio),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total (paid)',
                        style: TextStyle(
                          fontSize: 16 * ratio,
                          fontWeight: FontWeight.w600,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        '64.32\$',
                        style: TextStyle(
                          fontSize: 18 * ratio,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20 * ratio),
                  CustomButton(
                    text: 'Back',
                    onTap: () => Navigator.pop(context),
                  ),
                  SizedBox(height: 20 * ratio),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDetailItem(String label, String value, double ratio) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20 * ratio),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(
              fontSize: 14 * ratio,
              fontWeight: FontWeight.w400,
              color: Colors.grey.shade600,
            ),
          ),
          SizedBox(height: 6 * ratio),
          Text(
            value,
            style: TextStyle(
              fontSize: 16 * ratio,
              fontWeight: FontWeight.w600,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }
}
