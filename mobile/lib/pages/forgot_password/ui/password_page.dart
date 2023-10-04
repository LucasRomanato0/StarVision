import 'package:flutter/material.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/botao_amarelo.dart';
import 'package:mobile/widgets/container_principal.dart';
import 'package:mobile/widgets/text_field_widget.dart';

class PasswordPage extends StatelessWidget {
  const PasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: Center(
        child: SingleChildScrollView(
          child: ContainerPrincipal(
            loginOrRegister: 1,
            children: [
              const Text(
                "Esqueceu sua senha?",
                style: TextStyle(color: Colors.white, fontSize: 30),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 25, top: 8),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: 2,
                  decoration: BoxDecoration(
                    color: AppColors.azulBorda,
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const TextFieldWidget(
                labelText: 'Email cadastrado',
                hintText: 'teste@email.com',
              ),
              const TextFieldWidget(
                labelText: 'Nova senha',
                hintText: '***********',
                obscureText: true,
              ),
              const TextFieldWidget(
                labelText: 'Confirme sua senha',
                hintText: '***********',
                obscureText: true,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40),
                child: BotaoAmarelo(
                  onPressed: () {
                    Navigator.pushNamed(
                      context,
                      AppRoutes.login,
                    );
                  },
                  text: 'Confirmar',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
