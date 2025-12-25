import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/router/app_router.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/screens/register/components/forgot_button_with_icon.dart';
import 'package:yuu_sell/presentation/widgets/custom_button.dart';
import 'package:yuu_sell/presentation/widgets/custom_text_field.dart';
import 'package:yuu_sell/presentation/screens/register/components/phone_number_input.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
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
          child: ListView(
            padding: EdgeInsets.zero,
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
              Container(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height - (128 * ratio),
                ),
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
                      SizedBox(height: 18 * ratio),
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
                      ForgotButtonWithIcon(),
                      SizedBox(height: 22 * ratio),
                      CustomButton(
                        onTap: () {
                          context.push(AppRoutes.otp);
                        },
                      ),
                      SizedBox(height: 12 * ratio),
                      CustomButton(
                        isFilled: false,
                        onTap: () {
                          context.go(AppRoutes.login);
                        },
                      ),
                      SizedBox(height: 30 * ratio),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 46 * ratio,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10 * ratio),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.only(
                                        right: 4 * ratio,
                                      ),
                                      child: SvgPicture.asset(
                                        'assets/icons/google.svg',
                                      ),
                                    ),
                                    Text(
                                      'Google',
                                      style: AppFontStyles.s16w500(ratio),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(width: 14 * ratio),
                          Expanded(
                            child: Container(
                              height: 46 * ratio,
                              decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(10 * ratio),
                              ),
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.apple),
                                    Text(
                                      'Apple',
                                      style: AppFontStyles.s16w500(ratio),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
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
