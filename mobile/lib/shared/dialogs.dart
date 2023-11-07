import 'package:flutter/material.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/alert_box.dart';

class Dialogs {
  static Future<dynamic> showErro({
    required BuildContext context,
    required String msg,
  }) {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertBoxWidget(
        title: 'ERRO',
        content: msg,
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, 'Voltar'),
            child: Text(
              'Voltar',
              style: TextStyle(
                fontSize: 24,
                color: AppColors.azulClaro,
              ),
            ),
          )
        ],
      ),
    );
  }
}
