import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/domain/entities/user_entity.dart';

abstract class LoginRepository {
  Future<Either<Exception, UserEntity>> login({String login, String senha});
}
