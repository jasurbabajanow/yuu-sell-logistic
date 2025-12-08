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
  final bool signUp;
  const SignUpPage({super.key, required this.signUp});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSignUp = true;
  @override
  void initState() {
    isSignUp = widget.signUp;
    super.initState();
  }

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
              SizedBox(height: isSignUp ? 80 * ratio : 150 * ratio),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset('assets/icons/logo.svg'),
                  SizedBox(width: 26 * ratio),
                  SvgPicture.asset('assets/icons/logo-text.svg'),
                ],
              ),
              SizedBox(height: isSignUp ? 48 * ratio : 158 * ratio),
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
                        SizedBox(height: 18 * ratio),
                        Text(
                          isSignUp ? "Sign up" : "Log in",
                          style: AppFontStyles.s24w600(ratio),
                        ),
                        SizedBox(height: 30 * ratio),
                        isSignUp ? PhoneNumberInput() : SizedBox(),
                        SizedBox(height: isSignUp ? 18 * ratio : 0),
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
                        isSignUp
                            ? CustomTextField(
                                title: 'Password',
                                obscure: true,
                                hintText: '********',
                              )
                            : SizedBox(),
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
                            setState(() {
                              isSignUp = false;
                            });
                          },
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
