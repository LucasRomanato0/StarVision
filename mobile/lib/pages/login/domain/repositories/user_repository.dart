import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/domain/entities/user_entity.dart';

abstract class UserRepository {
  Future<Either<Exception, UserEntity>> login({
    required String login,
    required String senha,
  });

  Future<Either<Exception, UserEntity>> cadastro({
    required String login,
    required String email,
    required String phone,
    required String senha,
  });
}
