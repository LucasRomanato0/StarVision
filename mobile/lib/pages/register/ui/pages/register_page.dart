// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_multi_formatter/flutter_multi_formatter.dart';
import 'package:get_it/get_it.dart';
import 'package:mobile/app_routes.dart';
import 'package:mobile/pages/register/ui/controllers/register_controller.dart';
import 'package:mobile/shared/app_colors.dart';
import 'package:mobile/shared/dialogs.dart';
import 'package:mobile/widgets/botao_amarelo.dart';
import 'package:mobile/widgets/container_principal.dart';
import 'package:mobile/widgets/text_field_widget.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  late RegisterController controller;

  final TextEditingController controllerLogin = TextEditingController();
  final TextEditingController controllerEmail = TextEditingController();
  final TextEditingController controllerPhone = TextEditingController();
  final TextEditingController controllerPassword = TextEditingController();
  final TextEditingController controllerConfirmPassword =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    controller = GetIt.I.get();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.azulEscuro,
      body: Center(
        child: SingleChildScrollView(
          child: Observer(
            builder: (BuildContext context) => ContainerPrincipal(
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
                TextFieldWidget(
                  labelText: 'Escolha um nome de usuário',
                  hintText: 'usename',
                  controller: controllerLogin,
                ),
                Text(
                  controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                TextFieldWidget(
                  labelText: 'Email',
                  hintText: 'teste@email.com',
                  controller: controllerEmail,
                ),
                Text(
                  controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                TextFieldWidget(
                  labelText: 'Telefone',
                  hintText: '(xx) 99999-9999',
                  inputFormatters: [MaskedInputFormatter('(##) #####-####')],
                  controller: controllerPhone,
                ),
                Text(
                  controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                TextFieldWidget(
                  labelText: 'Digite uma senha',
                  hintText: '***********',
                  obscureText: true,
                  controller: controllerPassword,
                ),
                Text(
                  controller.mensagem == ''
                      ? controller.mensagemSenha
                      : controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                TextFieldWidget(
                  labelText: 'Confirme sua senha',
                  hintText: '***********',
                  obscureText: true,
                  controller: controllerConfirmPassword,
                ),
                Text(
                  controller.mensagem == ''
                      ? controller.mensagemSenha
                      : controller.mensagem,
                  style: const TextStyle(color: Colors.red),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 40),
                  child: BotaoAmarelo(
                    onPressed: () async {
                      if (controllerLogin.text.isEmpty ||
                          controllerEmail.text.isEmpty ||
                          controllerPhone.text.isEmpty ||
                          controllerPassword.text.isEmpty ||
                          controllerConfirmPassword.text.isEmpty) {
                        controller.setMensagemNull();
                      } else if (controllerPassword.text !=
                          controllerConfirmPassword.text) {
                        controller.setMensagemSenha();
                      } else {
                        await controller.onSubmitted(
                          login: controllerLogin.text,
                          email: controllerEmail.text,
                          phone: controllerPhone.text,
                          senha: controllerPassword.text,
                        );

                        if (controller.status == 201) {
                          Navigator.pushNamed(
                            context,
                            AppRoutes.login,
                          );
                        } else if (controller.status == 403) {
                          Dialogs.showAtencao(
                            context: context,
                            msg: 'Nome de usuário já existente',
                          );
                          controllerLogin.clear();
                          // controllerEmail.clear();
                          // controllerPhone.clear();
                          controllerPassword.clear();
                          controllerConfirmPassword.clear();
                        }
                      }
                    },
                    text: 'Cadastre-se',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
