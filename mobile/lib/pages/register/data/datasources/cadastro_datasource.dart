import 'package:mobile/pages/login/data/models/login_model.dart';

abstract class CadastroDatasource {
  Future<UserModel> cadastro({
    required String login,
    required String email,
    required String phone,
    required String senha,
  });
}
