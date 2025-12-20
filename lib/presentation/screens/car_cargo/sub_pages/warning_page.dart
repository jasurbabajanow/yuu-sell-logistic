import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/widgets/create_parcel_result.dart';

class WarningPage extends StatelessWidget {
  const WarningPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      backgroundColor: AppColors.bgWhite,
      appBar: AppBar(
        backgroundColor: AppColors.bgWhite,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.black, size: 20),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Car cargo',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28 * ratio),
        child: Column(
          children: [
            Row(),
            Padding(
              padding: EdgeInsets.only(top: 84 * ratio, bottom: 58 * ratio),
              child: SvgPicture.asset('assets/icons/warning_icon.svg'),
            ),
            Text(
              'If payment is not completed within 25 days, a 10% late fee will be added to the total amount. Please make the payment on time to avoid extra charges.',
              style: AppFontStyles.s16w700(ratio),
              textAlign: TextAlign.center,
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                vertical: 30 * ratio,
                horizontal: 80 * ratio,
              ),
              child: InkWell(
                onTap: (){
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => CreateParcelResult(),
                      ),
                    );
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.main,
                    borderRadius: BorderRadius.circular(12 * ratio),
                  ),
                  height: 46 * ratio,
                  child: Center(
                    child: Text(
                      'OK',
                      style: AppFontStyles.s14w700(
                        ratio,
                      ).copyWith(color: AppColors.white),
                    ),
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
