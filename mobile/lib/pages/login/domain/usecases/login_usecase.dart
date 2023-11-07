import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';

abstract class LoginUsecase {
  Future<Either<Exception, int>> call(String login, String senha);
}

class LoginUsecaseImpl extends LoginUsecase {
  UserRepository repo;
  LoginUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, int>> call(String login, String senha) async {
    return await repo.login(login: login, senha: senha);
  }
}
