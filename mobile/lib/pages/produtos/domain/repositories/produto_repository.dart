import 'package:dartz/dartz.dart';
import 'package:mobile/pages/produtos/domain/entities/produto_entity.dart';

abstract class ProdutoRepository {
  Future<Either<Exception, ProdutoEntity>> getProdutos();
}
