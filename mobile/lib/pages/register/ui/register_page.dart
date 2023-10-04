import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/botao_amarelo.dart';
import 'package:mobile/widgets/container_principal.dart';
import 'package:mobile/widgets/text_field_widget.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

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
                "Faça seu cadastro!",
                style: TextStyle(color: Colors.white, fontSize: 32),
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
                labelText: 'Escolha um nome de usuário',
                hintText: 'usename',
              ),
              const TextFieldWidget(
                labelText: 'Email',
                hintText: 'teste@email.com',
              ),
              const TextFieldWidget(
                labelText: 'Telefone',
                hintText: '(xx) 99999-9999',
              ),
              const TextFieldWidget(
                labelText: 'Digite uma senha',
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
                  text: 'CADASTRE-SE',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
