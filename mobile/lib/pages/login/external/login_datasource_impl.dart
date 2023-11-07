import 'package:dio/dio.dart';
import 'package:mobile/pages/login/data/datasources/login_datasource.dart';

class LoginDatasourceImpl implements LoginDatasource {
  final Dio _dio = Dio();

  @override
  Future<int> login({required String login, required String senha}) async {
    try {
      var response = await _dio.post(
        'http://localhost:3005/login',
        data: {
          'login': login,
          'password': senha,
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
