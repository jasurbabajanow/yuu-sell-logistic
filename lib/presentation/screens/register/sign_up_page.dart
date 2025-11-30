import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/register/components/custom_text_field.dart';
import 'package:yuu_sell/presentation/screens/register/components/phone_number_input.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [AppColors.mainLight, AppColors.mainDark],
            ),
          ),
          child: Column(
            children: [
              SizedBox(height: 80 * ratio),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logo.svg'),
                  SizedBox(width: 26 * ratio),
                  SvgPicture.asset('assets/icons/logo-text.svg'),
                ],
              ),
              SizedBox(height: 48 * ratio),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                    color: AppColors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30 * ratio),
                      topRight: Radius.circular(30 * ratio),
                    ),
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24 * ratio),
                    child: Column(
                      children: [
                        Row(),
                        Text("Sign up", style: AppFontStyles.s24w600(ratio)),
                        SizedBox(height: 30 * ratio),
                        PhoneNumberInput(),
                        SizedBox(height: 18 * ratio),
                        CustomTextField(
                          title: 'Email Address',
                          hintText: 'example@gmail.com',
                        ),
                        SizedBox(height: 18 * ratio),
                        CustomTextField(
                          title: 'Password',
                          obscure: true,
                          hintText: '********',
                        ),
                        SizedBox(height: 18 * ratio),
                        CustomTextField(
                          title: 'Password',
                          obscure: true,
                          hintText: '********',
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
