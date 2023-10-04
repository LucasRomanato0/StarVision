import 'package:flutter/material.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/container_principal.dart';
import 'package:mobile/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              ContainerPrincipal(
                loginOrRegister: 1,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 25, bottom: 10),
                    child: TextFieldWidget(
                      hintText: 'email@teste.com',
                      labelText: 'Email',
                      suffixIcon: Icon(
                        Icons.email,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  TextFieldWidget(
                    hintText: '*******',
                    labelText: 'Senha',
                    obscureText: true,
                    suffixIcon: Icon(
                      Icons.lock,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
