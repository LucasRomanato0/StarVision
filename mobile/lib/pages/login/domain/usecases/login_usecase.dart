import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/domain/entities/user_entity.dart';
import 'package:mobile/pages/login/domain/repositories/login_repository.dart';

abstract class LoginUsecase {
  Future<Either<Exception, UserEntity>> call(String login, String senha);
}

class LoginUsecaseImpl extends LoginUsecase {
  LoginRepository repo;
  LoginUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, UserEntity>> call(String login, String senha) async {
    return await repo.login(login: login, senha: senha);
  }
}
