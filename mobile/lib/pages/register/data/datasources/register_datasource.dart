abstract class RegisterDatasource {
  Future<int> register({
    required String login,
    required String email,
    required String phone,
    required String password,
  });
}
