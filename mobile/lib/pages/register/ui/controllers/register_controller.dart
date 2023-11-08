import 'package:mobile/pages/register/domain/usecases/register_usecase.dart';
import 'package:mobx/mobx.dart';

part 'register_controller.g.dart';

class RegisterController = _RegisterController with _$RegisterController;

abstract class _RegisterController with Store {
  final RegisterUsecase usecase;
  _RegisterController(this.usecase);

  @observable
  int? status;
  @action
  Future<int?> onSubmitted({
    required login,
    required email,
    required phone,
    required senha,
  }) async {
    var result = await usecase(login, email, phone, senha);

    return result.fold(
      (l) => status = 500,
      (r) => status = r,
    );
  }

  @observable
  String mensagem = '';
  @action
  setMensagem() => mensagem = 'Usuário já existente';
  @action
  setMensagemNull() => mensagem = 'Campo obrigatório';

  @observable
  String mensagemSenha = '';
  @action
  setMensagemSenha() {
    mensagem = '';
    mensagemSenha = 'Senhas diferentes';
  }
}
