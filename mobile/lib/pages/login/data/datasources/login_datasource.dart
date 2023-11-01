import 'package:mobile/pages/login/data/models/login_model.dart';

abstract class LoginDatasource {
  Future<UserModel> login({required String login, required String senha});
}
