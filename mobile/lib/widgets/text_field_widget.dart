import 'package:flutter/material.dart';
import 'package:mobile/shared/app_colors.dart';

class TextFieldWidget extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextInputType? keyboardType;
  final Widget? suffixIcon;
  final bool? obscureText;
  const TextFieldWidget({
    super.key,
    required this.labelText,
    required this.hintText,
    this.keyboardType,
    this.suffixIcon,
    this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardType,
      obscureText: obscureText ?? false,
      textInputAction: TextInputAction.done,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        labelText: labelText,
        labelStyle: TextStyle(
          color: AppColors.cinza,
          fontSize: 16,
        ),
        hintText: hintText,
        hintStyle: const TextStyle(color: Color.fromARGB(255, 51, 71, 83)),
        suffixIcon: suffixIcon,
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
            width: 1,
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: AppColors.amarelo,
            width: 1,
          ),
        ),
      ),
    );
  }
}
