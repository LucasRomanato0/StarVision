import 'package:dartz/dartz.dart';
import 'package:mobile/pages/cart/domain/repositories/cart_repository.dart';

abstract class GetCartUsecase {
  Future<Either<Exception, dynamic>> call();
}

class GetCartUsecaseImpl implements GetCartUsecase {
  CartRepository repo;
  GetCartUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, dynamic>> call() async {
    return await repo.getCart();
  }
}
