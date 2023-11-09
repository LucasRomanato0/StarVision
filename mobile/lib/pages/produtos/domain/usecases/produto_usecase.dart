import 'package:dartz/dartz.dart';
import 'package:mobile/pages/produtos/domain/entities/produto_entity.dart';
import 'package:mobile/pages/produtos/domain/repositories/produto_repository.dart';

abstract class ProdutoUsecase {
  Future<Either<Exception, List<ProdutoEntity>>> call();
}

class ProdutoUsecaseImpl implements ProdutoUsecase {
  ProdutoRepository repo;
  ProdutoUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, List<ProdutoEntity>>> call() async {
    return await repo.getProdutos();
  }
}
