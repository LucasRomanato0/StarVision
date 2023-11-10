import 'package:dartz/dartz.dart';

abstract class CartRepository {
  Future<Either<Exception, dynamic>> getCart();
}
