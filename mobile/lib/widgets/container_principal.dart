import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:mobile/shared/app_colors.dart';

class ContainerPrincipal extends StatelessWidget {
  final Widget? child;
  final List<Widget>? children;
  final int loginOrRegister;
  const ContainerPrincipal({
    super.key,
    this.child,
    required this.loginOrRegister,
    this.children,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      // height: 500,
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 35),
      decoration: BoxDecoration(
        color: AppColors.azulClaro,
        borderRadius: BorderRadius.circular(20),
        border: GradientBoxBorder(
          gradient: LinearGradient(
            colors: [AppColors.azulBorda, AppColors.amarelo],
          ),
          width: 2,
        ),
      ),
      child: loginOrRegister == 1
          ? Column(
              children: [
                ...children!,
              ],
            )
          : child,
    );
  }
}
