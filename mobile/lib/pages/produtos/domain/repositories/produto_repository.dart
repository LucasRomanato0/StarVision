import 'package:dartz/dartz.dart';

abstract class ProdutoRepository {
  Future<Either<Exception, dynamic>> getProdutos();
  Future<Either<Exception, int>> addProduct(int id);
}
