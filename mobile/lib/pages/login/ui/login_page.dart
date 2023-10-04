import 'package:flutter/material.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/widgets/botao_amarelo.dart';
import 'package:mobile/widgets/container_principal.dart';
import 'package:mobile/widgets/text_field_widget.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/logo.png';

    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: Center(
        child: SingleChildScrollView(
          child: ContainerPrincipal(
            loginOrRegister: 1,
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
              const Padding(
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
              const TextFieldWidget(
                hintText: '*******',
                labelText: 'Senha',
                obscureText: true,
                suffixIcon: Icon(
                  Icons.lock,
                  color: Colors.white,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Esqueci minha senha",
                      style: TextStyle(
                        color: Colors.white,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60),
                child: BotaoAmarelo(
                  onPressed: () {},
                  text: 'Login',
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Não possui conta?',
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.register,
                        );
                      },
                      child: const Text(
                        'Cadastre-se',
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
