import 'package:dartz/dartz.dart';
import 'package:mobile/pages/produtos/data/datasources/produto_datasource.dart';
import 'package:mobile/pages/produtos/domain/entities/produto_entity.dart';
import 'package:mobile/pages/produtos/domain/repositories/produto_repository.dart';

class ProdutoRepositoryImpl implements ProdutoRepository {
  ProdutoDatasource datasource;
  ProdutoRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, ProdutoEntity>> getProdutos() async {
    try {
      final result = await datasource.getProdutos();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
