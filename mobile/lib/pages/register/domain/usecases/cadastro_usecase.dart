import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/domain/entities/user_entity.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';

abstract class CadastroUsecase {
  Future<Either<Exception, UserEntity>> call(
    String login,
    String email,
    String phone,
    String senha,
  );
}

class CadastroUsecaseImpl extends CadastroUsecase {
  UserRepository repo;
  CadastroUsecaseImpl(this.repo);

  @override
  Future<Either<Exception, UserEntity>> call(
    String login,
    String email,
    String phone,
    String senha,
  ) async {
    return await repo.cadastro(
      login: login,
      email: email,
      phone: phone,
      senha: senha,
    );
  }
}
