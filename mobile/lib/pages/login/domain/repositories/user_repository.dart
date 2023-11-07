import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Exception, int>> login({
    required String login,
    required String senha,
  });

  // Future<Either<Exception, int>> cadastro({
  //   required String login,
  //   required String email,
  //   required String phone,
  //   required String senha,
  // });
}
