import 'package:dartz/dartz.dart';
import 'package:mobile/pages/cart/data/datasources/get_cart_datasource.dart';
import 'package:mobile/pages/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImpl implements CartRepository {
  GetCartDatasource datasource;
  CartRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, dynamic>> getCart() async {
    try {
      final result = await datasource.getCart();
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
