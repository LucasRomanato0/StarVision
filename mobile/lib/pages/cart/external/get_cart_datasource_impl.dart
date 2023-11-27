import 'package:dio/dio.dart';
import 'package:mobile/pages/cart/data/datasources/get_cart_datasource.dart';

class GetCartDatasourceImpl implements GetCartDatasource {
  final Dio _dio = Dio();

  @override
  Future getCart() async {
    try {
      var response = await _dio.get(
        'http://172.23.208.1:3030/cart', // colocar o ip da maquina
      );

      return response.data;
    } catch (e) {
      print(e);

      if (e is DioException) {
        return e.response!.statusCode;
      }

      throw Exception('Erro no dio - $e');
    }
  }
}
