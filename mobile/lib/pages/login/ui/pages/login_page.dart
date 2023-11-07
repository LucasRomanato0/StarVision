// ignore_for_file: use_build_context_synchronously

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/login/ui/controllers/login_controller.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/shared/dialogs.dart';
import 'package:mobile/widgets/botao_amarelo.dart';
import 'package:mobile/widgets/container_principal.dart';
import 'package:mobile/widgets/text_field_widget.dart';
import 'package:perfect_volume_control/perfect_volume_control.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final player = AudioCache();
  late LoginController controller;

  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get();
    PerfectVolumeControl.setVolume(0.2);
    player.play('imperial_theme.mp3');
  }

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/logo.png';

    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: Center(
        child: SingleChildScrollView(
          child: Observer(
            builder: (BuildContext context) => ContainerPrincipal(
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
                Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: TextFieldWidget(
                    controller: controllerEmail,
                    hintText: 'email@teste.com',
                    labelText: 'Email',
                    suffixIcon: const Icon(
                      Icons.email,
                      color: Colors.white,
                    ),
                    // onSubmitted: controller.setEmail(controllerEmail.text),
                  ),
                ),
                Text(
                  controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                TextFieldWidget(
                  controller: controllerPassword,
                  hintText: '*******',
                  labelText: 'Senha',
                  obscureText: true,
                  suffixIcon: const Icon(
                    Icons.lock,
                    color: Colors.white,
                  ),
                  // onSubmitted: controller.setPassword(controllerPassword.text),
                ),
                Text(
                  controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.forgotPassword,
                        );
                      },
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
                    onPressed: () async {
                      if (controllerEmail.text.isEmpty ||
                          controllerPassword.text.isEmpty) {
                        controller.setMensagemNull();
                      } else {
                        await controller.onSubmitted(
                          email: controllerEmail.text,
                          password: controllerPassword.text,
                        );
                        if (controller.status == 200) {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.navigationBar,
                          );
                        } else if (controller.status == 402) {
                          controller.setMensagem();
                        } else {
                          Dialogs.showErro(
                            context: context,
                            msg: 'Erro na aplicação.',
                          );
                        }
                      }
                    },
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
      ),
    );
  }
}
