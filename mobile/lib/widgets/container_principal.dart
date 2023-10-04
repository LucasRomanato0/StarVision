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
    String imagePath = 'assets/images/logo.png';

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
                const Text(
                  "Bem Vindo!",
                  style: TextStyle(color: Colors.white, fontSize: 32),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: Container(
                    // alignment: Alignment.topCenter,
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.3,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                ...children!,
              ],
            )
          : child,
    );
  }
}
