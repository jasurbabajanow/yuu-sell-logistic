import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/presentation/widgets/search_bar_widget.dart';

class _NotificationItem {
  final String assetPath;
  final Color iconColor;
  final Color iconBgColor;
  final String title;
  final String subtitle;
  final String? rightText;
  final bool hasRedDot;

  const _NotificationItem({
    required this.assetPath,
    required this.iconColor,
    required this.iconBgColor,
    required this.title,
    required this.subtitle,
    this.rightText,
    this.hasRedDot = false,
  });
}

class MessagesPage extends StatelessWidget {
  const MessagesPage({super.key});
  static const Color _blueColor = Colors.blue;
  static const Color _tealColor = Colors.teal;
  static const Color _blueBgColor = Color(0xFFE3F2FD);
  static const Color _tealBgColor = Color(0xFFE0F2F1);

  static const List<_NotificationItem> _todayNotifications = [
    _NotificationItem(
      assetPath: 'assets/icons/ticker_sale.svg',
      iconColor: _blueColor,
      iconBgColor: _blueBgColor,
      title: 'Get 20% Discount Code',
      subtitle: 'Get discount codes from sharing with friends.',
      hasRedDot: true,
    ),
    _NotificationItem(
      assetPath: 'assets/icons/check_circle.svg',
      iconColor: _tealColor,
      iconBgColor: _tealBgColor,
      title: 'Air-2025-00124',
      subtitle: 'All express',
      rightText: 'USA to TKM',
      hasRedDot: true,
    ),
    _NotificationItem(
      assetPath: 'assets/icons/ticker_sale.svg',
      iconColor: _blueColor,
      iconBgColor: _blueBgColor,
      title: 'Get 20% Discount Code',
      subtitle: 'Get discount codes from sharing with friends.',
      hasRedDot: true,
    ),
    _NotificationItem(
      assetPath: 'assets/icons/ticker_sale.svg',
      iconColor: _blueColor,
      iconBgColor: _blueBgColor,
      title: 'Get 20% Discount Code',
      subtitle: 'Get discount codes from sharing with friends.',
      hasRedDot: true,
    ),
    _NotificationItem(
      assetPath: 'assets/icons/check_circle.svg',
      iconColor: _tealColor,
      iconBgColor: _tealBgColor,
      title: 'Air-2025-00124',
      subtitle: 'All express',
      rightText: 'USA to TKM',
      hasRedDot: true,
    ),
  ];

  static const List<_NotificationItem> _yesterdayNotifications = [
    _NotificationItem(
      assetPath: 'assets/icons/check_circle.svg',
      iconColor: _tealColor,
      iconBgColor: _tealBgColor,
      title: 'Air-2025-00124',
      subtitle: 'All express',
      rightText: 'USA to TKM',
      hasRedDot: true,
    ),
    _NotificationItem(
      assetPath: 'assets/icons/ticker_sale.svg',
      iconColor: _blueColor,
      iconBgColor: _blueBgColor,
      title: 'Get 20% Discount Code',
      subtitle: 'Get discount codes from sharing with friends.',
      hasRedDot: true,
    ),
    _NotificationItem(
      assetPath: 'assets/icons/check_circle.svg',
      iconColor: _tealColor,
      iconBgColor: _tealBgColor,
      title: 'Air-2025-00124',
      subtitle: 'All express',
      rightText: 'USA to TKM',
      hasRedDot: true,
    ),
  ];
  void _openQRScanner(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => const _QRScannerSheet(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Messages',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w600,
              fontSize: 18,
            ),
          ),
        ),
        floatingActionButton: SizedBox(
          width: 60 * ratio,
          height: 60 * ratio,
          child: FloatingActionButton(
            backgroundColor: AppColors.main,
            shape: const CircleBorder(),
            onPressed: () => _openQRScanner(context),
            child: SvgPicture.asset('assets/icons/scan.svg'),
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const SearchBarWidget(),
            SizedBox(height: 16 * ratio),
            const Text(
              'Today',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            ..._todayNotifications.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildNotificationItem(item),
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Yesterday',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 12),
            ..._yesterdayNotifications.map(
              (item) => Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: _buildNotificationItem(item),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationItem(_NotificationItem item) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: const Color(0xFFFAFAFA),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Container(
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              color: item.iconBgColor,
              borderRadius: BorderRadius.circular(10),
            ),
            child: SvgPicture.asset(
              item.assetPath,
              colorFilter: ColorFilter.mode(item.iconColor, BlendMode.srcIn),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  item.title,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        item.subtitle,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF757575),
                        ),
                      ),
                    ),
                    if (item.rightText != null)
                      Text(
                        item.rightText!,
                        style: const TextStyle(
                          fontSize: 13,
                          color: Color(0xFF757575),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          if (item.hasRedDot)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                color: Colors.red,
                shape: BoxShape.circle,
              ),
            ),
        ],
      ),
    );
  }
}

class _QRScannerSheet extends StatefulWidget {
  const _QRScannerSheet();

  @override
  State<_QRScannerSheet> createState() => _QRScannerSheetState();
}

class _QRScannerSheetState extends State<_QRScannerSheet> {
  final MobileScannerController _controller = MobileScannerController();
  bool _hasScanned = false;

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onDetect(BarcodeCapture capture) {
    if (_hasScanned) return;
    final barcode = capture.barcodes.firstOrNull;
    if (barcode?.rawValue != null) {
      _hasScanned = true;
      Navigator.of(context).pop(barcode!.rawValue);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text('Scanned: ${barcode.rawValue}')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.8,
      decoration: const BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Scan QR Code',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.of(context).pop(),
                  icon: const Icon(Icons.close, color: Colors.white),
                ),
              ],
            ),
          ),
          Expanded(
            child: ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: MobileScanner(
                  controller: _controller,
                  onDetect: _onDetect,
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () => _controller.toggleTorch(),
                  icon: const Icon(Icons.flash_on, color: Colors.white),
                ),
                const SizedBox(width: 32),
                IconButton(
                  onPressed: () => _controller.switchCamera(),
                  icon: const Icon(Icons.cameraswitch, color: Colors.white),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
