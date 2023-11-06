abstract class CadastroDatasource {
  Future<int> cadastro({
    required String login,
    required String email,
    required String phone,
    required String senha,
  });
}
