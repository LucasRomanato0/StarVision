import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile/pages/produtos/data/datasources/produto_datasource.dart';
import 'package:mobile/pages/produtos/data/models/produto_model.dart';

class ProdutoDatasourceImpl implements ProdutoDatasource {
  final Dio _dio = Dio();

  @override
  Future<ProdutoModel> getProdutos() async {
    try {
      var response = await _dio.post(
        'http://172.29.48.1:3030/products', // colocar o ip da maquina
      );

      Map<String, dynamic> retorno = json.decode(response.data);
      ProdutoModel objProduto = ProdutoModel.fromJson(retorno);

      return objProduto;
    } catch (e) {
      print(e);

      if (e is DioException) {
        return e.response!.data;
      }

      throw Exception('Erro no dio - $e');
    }
  }
}
