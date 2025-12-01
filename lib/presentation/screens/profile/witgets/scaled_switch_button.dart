import 'package:flutter/material.dart';
import 'package:yuu_sell/core/theme/app_colors.dart';

class ScaledSwitchButton extends StatelessWidget {
  final bool value;
  final ValueChanged<bool>? onChanged;
  final double scale;
  final Color? activeColor;

  const ScaledSwitchButton({
    super.key,
    required this.value,
    this.onChanged,
    this.scale = 0.8,
    this.activeColor,
  });

  static const WidgetStateProperty<Color> _transparentBorder =
      WidgetStatePropertyAll(Colors.transparent);

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: scale,
      child: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: activeColor,
        inactiveThumbColor: AppColors.white,
        inactiveTrackColor: AppColors.textFieldBorder,
        trackOutlineColor: _transparentBorder,
      ),
    );
  }
}
