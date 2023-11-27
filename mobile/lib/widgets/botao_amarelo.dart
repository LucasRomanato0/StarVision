import 'package:flutter/material.dart';
import 'package:mobile/shared/app_colors.dart';

class BotaoAmarelo extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final double? size;
  const BotaoAmarelo({super.key, required this.onPressed, required this.text, this.size});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.amarelo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      onPressed: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.symmetric(vertical: 5),
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(color: Colors.black, fontSize: size ?? 32),
        ),
      ),
    );
  }
}
