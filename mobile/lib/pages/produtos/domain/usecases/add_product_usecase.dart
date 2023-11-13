import 'package:dartz/dartz.dart';
import 'package:mobile/pages/produtos/domain/repositories/produto_repository.dart';

abstract class AddProductUsecase {
  Future<Either<Exception, int>> call(int id);
}

class AddProductUsecaseImpl implements AddProductUsecase {
  ProdutoRepository repo;
  AddProductUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, int>> call(int id) async {
    return await repo.addProduct(id);
  }
}
