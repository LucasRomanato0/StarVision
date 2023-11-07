import 'package:dio/dio.dart';
import 'package:mobile/pages/register/data/datasources/register_datasource.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
  final Dio _dio = Dio();

  @override
  Future<int> register({
    required String login,
    required String email,
    required String phone,
    required String senha,
    required String confirmaSenha,
  }) async {
    try {
      var response = await _dio.post(
        'http://localhost:3005/cadastro',
        data: {
          login: login,
          email: email,
          phone: phone,
          senha: senha,
        },
      );

      if (response.statusCode.toString() == '200') {
        return response.statusCode!;
      } else {
        throw Exception("Erro no processamento - ${response.statusCode}");
      }
    } catch (e) {
      print(e);

      throw Exception('Erro no dio - $e');
    }
  }
}
