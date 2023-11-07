import 'package:flutter/material.dart';

class AlertBoxWidget extends StatelessWidget {
  AlertBoxWidget({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.cor,
  });

  final String title;
  final String content;
  final List<Widget>? actions;
  final Color? cor;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Center(child: Text(title)),
      content: Text(
        content,
        style: const TextStyle(
          fontSize: 20,
        ),
        textAlign: TextAlign.justify,
      ),
      backgroundColor: cor ?? Colors.white,
      actionsAlignment: MainAxisAlignment.center,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      actions: actions,
    );
  }
}
