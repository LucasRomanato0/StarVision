import 'package:dio/dio.dart';
import 'package:mobile/pages/produtos/data/datasources/add_product_datasource.dart';

class AddProductDatasourceImpl implements AddProductDatasource {
  final Dio _dio = Dio();

  @override
  Future<int> addProduct(int id) async {
    try {
      var response = await _dio.post(
        'http://172.29.48.1:3030/cart', // colocar o ip da maquina
        data: {'id': id},
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
