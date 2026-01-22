import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class PhoneNumberInput extends StatefulWidget {
  final void Function(String phoneNumber)? onPhoneChanged;
  final String initialCountryCode;

  const PhoneNumberInput({
    super.key,
    this.onPhoneChanged,
    this.initialCountryCode = 'US',
  });

  @override
  State<PhoneNumberInput> createState() => _PhoneNumberInputState();
}

class _PhoneNumberInputState extends State<PhoneNumberInput> {
  final TextEditingController _controller = TextEditingController();
  late PhoneNumber _phoneNumber;

  @override
  void initState() {
    super.initState();
    _phoneNumber = PhoneNumber(isoCode: widget.initialCountryCode);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Phone number',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF6B7280),
            letterSpacing: -0.2,
          ),
        ),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(color: AppColors.textFieldBorder, width: 1.5),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withValues(alpha: 0.02),
                blurRadius: 2,
                offset: const Offset(0, 1),
              ),
            ],
          ),
          child: InternationalPhoneNumberInput(
            onInputChanged: (PhoneNumber number) {
              setState(() {
                _phoneNumber = number;
              });
              widget.onPhoneChanged?.call(number.phoneNumber ?? '');
            },
            selectorConfig: const SelectorConfig(
              selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
              useEmoji: true,
              setSelectorButtonAsPrefixIcon: false,
              leadingPadding: 16,
              trailingSpace: false,
              useBottomSheetSafeArea: true,
            ),
            ignoreBlank: false,
            autoValidateMode: AutovalidateMode.disabled,
            selectorTextStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111827),
            ),
            initialValue: _phoneNumber,
            textFieldController: _controller,
            formatInput: false,
            keyboardType: const TextInputType.numberWithOptions(
              signed: false,
              decimal: false,
            ),
            inputDecoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              border: InputBorder.none,
              hintText: '',
              hintStyle: TextStyle(
                color: Color(0xFFD1D5DB),
                fontWeight: FontWeight.w400,
              ),
            ),
            textStyle: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF111827),
            ),
            spaceBetweenSelectorAndTextField: 0,
            countrySelectorScrollControlled: true,
            searchBoxDecoration: InputDecoration(
              labelText: 'Search country',
              prefixIcon: const Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
