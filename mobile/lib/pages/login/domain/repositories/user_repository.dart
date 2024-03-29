import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Exception, int>> login({
    required String login,
    required String senha,
  });

  Future<Either<Exception, int>> register({
    required String login,
    required String email,
    required String phone,
    required String password,
  });
}
