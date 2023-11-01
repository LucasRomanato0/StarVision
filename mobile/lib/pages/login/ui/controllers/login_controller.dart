import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

class LoginController = _LoginController with _$LoginController;

abstract class _LoginController with Store {
  @observable
  String email = '';
  @action
  setEmail(String value) => email = value;

  @observable
  String password = '';
  @action
  setPassword(String value) => password = value;
}
