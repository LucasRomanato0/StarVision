import 'package:dio/dio.dart';
import 'package:mobile/pages/produtos/data/datasources/produto_datasource.dart';

class ProdutoDatasourceImpl implements ProdutoDatasource {
  final Dio _dio = Dio();

  @override
  Future<dynamic> getProdutos() async {
    try {
      var response = await _dio.get(
        'http://172.23.208.1:3030/products', // colocar o ip da maquina
      );

      return response.data;
    } catch (e) {
      print(e);

      if (e is DioException) {
        return e.response!.data;
      }

      throw Exception('Erro no dio - $e');
    }
  }
}
