import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/container_principal.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: const ContainerPrincipal(loginOrRegister: 1),
    );
  }
}
