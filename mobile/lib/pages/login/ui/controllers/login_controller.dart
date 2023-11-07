import 'package:mobile/pages/login/domain/usecases/login_usecase.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final LoginUsecase usecase;
  _LoginController(this.usecase);

  @observable
  int? status;
  @action
  Future<int?> onSubmitted({required email, required password}) async {
    var result = await usecase(email, password);

    return result.fold(
      (l) => status = 500,
      (r) => status = r,
    );
  }

  @observable
  String mensagem = '';
  @action
  setMensagem() => mensagem = 'Login ou senha errados';

  @action
  setMensagemNull() => mensagem = 'Campo obrigatório';
}
