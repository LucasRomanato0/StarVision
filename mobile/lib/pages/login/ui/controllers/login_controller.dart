import 'package:mobile/pages/login/domain/usecases/login_usecase.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  final LoginUsecase usecase;
  _LoginController(this.usecase);

  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;

  @observable
  int? status;
  @action
  Future<int?> onSubmitted() async {
    var result = await usecase(email, password);

    return result.fold(
      (l) => null,
      (r) => status = r,
    );
  }
}
