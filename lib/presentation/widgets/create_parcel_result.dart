import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';

class CreateParcelResult extends StatelessWidget {
  const CreateParcelResult({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
            size: 20 * ratio,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Parcel Created Successfully',
          style: TextStyle(
            color: Colors.black,
            fontSize: 17 * ratio,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      backgroundColor: AppColors.bgWhite,
      body: Column(
        children: [
          Row(),
          SizedBox(height: 52 * ratio),
          Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.green.withValues(alpha: .3),
            ),
            child: Padding(
              padding: EdgeInsets.all(24 * ratio),
              child: Icon(Icons.check, color: Colors.green, size: 34 * ratio),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 42 * ratio, bottom: 16 * ratio),
            child: Text(
              'Electronic declaration created',
              style: AppFontStyles.s16w700(ratio),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'YU00 0000 0401 3037 USSU',
                style: AppFontStyles.s14w600(
                  ratio,
                ).copyWith(color: AppColors.mainLight),
              ),

              Padding(
                padding: EdgeInsets.only(left: 6 * ratio),
                child: Icon(Icons.copy_all_sharp),
              ),
            ],
          ),
          SizedBox(height: 8 * ratio),
          Text(
            'Pick up and send a parcel from \n the nearest branch',
            textAlign: TextAlign.center,
            style: AppFontStyles.s14w500(ratio),
          ),
          SizedBox(height: 8 * ratio),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 84 * ratio),
            child: CustomButton(
              onTap: () {
                context.go('/home');
              },
              text: "Download PDF",
            ),
          ),
        ],
      ),
    );
  }
}
