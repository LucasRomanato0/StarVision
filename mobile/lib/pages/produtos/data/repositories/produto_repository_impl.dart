import 'package:dartz/dartz.dart';
import 'package:mobile/pages/produtos/data/datasources/add_product_datasource.dart';
import 'package:mobile/pages/produtos/data/datasources/produto_datasource.dart';
import 'package:mobile/pages/produtos/domain/repositories/produto_repository.dart';

class ProdutoRepositoryImpl implements ProdutoRepository {
  ProdutoDatasource getDatasource;
  AddProductDatasource addDatasource;
  ProdutoRepositoryImpl(this.getDatasource, this.addDatasource);

  @override
  Future<Either<Exception, dynamic>> getProdutos() async {
    try {
      final result = await getDatasource.getProdutos();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, int>> addProduct(int id) async {
    try {
      final result = await addDatasource.addProduct(id);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
