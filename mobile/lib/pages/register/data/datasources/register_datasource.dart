abstract class RegisterDatasource {
  Future<int> register({
    required String login,
    required String email,
    required String phone,
    required String senha,
    required String confirmaSenha,
  });
}
