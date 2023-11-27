import 'package:dio/dio.dart';
import 'package:mobile/pages/register/data/datasources/register_datasource.dart';

class RegisterDatasourceImpl implements RegisterDatasource {
  final Dio _dio = Dio();

  @override
  Future<int> register({
    required String login,
    required String email,
    required String phone,
    required String password,
  }) async {
    try {
      var response = await _dio.post(
        'http://172.23.208.1:3005/cadastro', // colocar o ip da maquina
        data: {
          'login': login,
          'email': email,
          'phone': phone,
          'password': password,
        },
      );

      if (response.statusCode.toString() == '201') {
        return response.statusCode!;
      } else {
        throw Exception("Erro no processamento - ${response.statusCode}");
      }
    } catch (e) {
      print(e);

      if (e is DioException) {
        return e.response!.statusCode!;
      }

      throw Exception('Erro no dio - $e');
    }
  }
}
