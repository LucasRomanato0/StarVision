import 'package:flutter/material.dart';
import 'package:mobile/shared/app_colors.dart';

class TextFieldAppBar extends StatelessWidget {
  const TextFieldAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10),
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.amareloEscuro,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Icon(
            Icons.search,
            color: AppColors.amareloClaro,
            size: 40,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 0.5,
            margin: const EdgeInsets.symmetric(horizontal: 10),
            child: TextField(
              decoration: InputDecoration(
                hintText: 'Buscar na StarVision',
                hintStyle: TextStyle(
                  color: AppColors.amareloClaro,
                  fontSize: 20,
                ),
                border: InputBorder.none,
              ),
              style: TextStyle(
                color: AppColors.amareloClaro,
                fontSize: 20,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
