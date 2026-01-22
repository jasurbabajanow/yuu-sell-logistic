import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:yuu_sell/core/constants/app_sizes.dart';
import 'package:yuu_sell/core/router/app_router.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';
import 'package:yuu_sell/core/theme/app_font_styles.dart';
import 'package:yuu_sell/presentation/providers/auth_provider.dart';
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
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  String _phoneNumber = '';

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  Future<void> _handleSignUp() async {
    if (_phoneNumber.isEmpty) {
      _showError('Please enter your phone number');
      return;
    }

    if (_emailController.text.isEmpty) {
      _showError('Please enter your email');
      return;
    }

    if (_passwordController.text.isEmpty) {
      _showError('Please enter your password');
      return;
    }

    if (_passwordController.text != _confirmPasswordController.text) {
      _showError('Passwords do not match');
      return;
    }

    final authProvider = context.read<AuthProvider>();

    final success = await authProvider.register(
      email: _emailController.text.trim(),
      phone: _phoneNumber,
      password: _passwordController.text,
      firstName: '',
      lastName: '',
      role: '',
    );

    if (success && mounted) {
      context.go(AppRoutes.home);
    } else if (mounted && authProvider.errorMessage != null) {
      _showError(authProvider.errorMessage!);
    }
  }

  void _showError(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: Colors.red,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final ratio = AppSizes.ratio(context);
    final authProvider = context.watch<AuthProvider>();

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
          child: Form(
            key: _formKey,
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
                        PhoneNumberInput(
                          onPhoneChanged: (phone) {
                            _phoneNumber = phone;
                          },
                        ),
                        SizedBox(height: 18 * ratio),
                        CustomTextField(
                          title: 'Email Address',
                          hintText: 'example@gmail.com',
                          controller: _emailController,
                          keyboardType: TextInputType.emailAddress,
                        ),
                        SizedBox(height: 18 * ratio),
                        CustomTextField(
                          title: 'Password',
                          obscure: true,
                          hintText: '********',
                          controller: _passwordController,
                        ),
                        SizedBox(height: 18 * ratio),
                        CustomTextField(
                          title: 'Confirm Password',
                          obscure: true,
                          hintText: '********',
                          controller: _confirmPasswordController,
                        ),
                        ForgotButtonWithIcon(),
                        SizedBox(height: 22 * ratio),
                        CustomButton(
                          onTap: authProvider.isLoading ? null : _handleSignUp,
                          isLoading: authProvider.isLoading,
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
      ),
    );
  }
}
