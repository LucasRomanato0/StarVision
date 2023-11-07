import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';

abstract class RegisterUsecase {
  Future<Either<Exception, int>> call(
    String login,
    String email,
    String phone,
    String senha,
    String confirmaSenha,
  );
}

class RegisterUsecaseImpl implements RegisterUsecase {
  UserRepository repo;
  RegisterUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, int>> call(
    String login,
    String email,
    String phone,
    String senha,
    String confirmaSenha,
  ) async {
    return await repo.register(
      login: login,
      email: email,
      phone: phone,
      senha: senha,
      confirmaSenha: confirmaSenha,
    );
  }
}
