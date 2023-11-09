import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:mobile/pages/produtos/data/datasources/produto_datasource.dart';
import 'package:mobile/pages/produtos/data/models/produto_model.dart';

class ProdutoDatasourceImpl implements ProdutoDatasource {
  final Dio _dio = Dio();

  @override
  Future<List<ProdutoModel>> getProdutos() async {
    try {
      var response = await _dio.get(
        'http://172.29.48.1:3030/products', // colocar o ip da maquina
      );

      // codigo nojento para transformar a lista que recebo no response
      // em List<ProdutoModel>
      List<ProdutoModel> objProduto = (json.decode(response.data) as List)
          .map((i) => ProdutoModel.fromJson(i))
          .toList();

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
