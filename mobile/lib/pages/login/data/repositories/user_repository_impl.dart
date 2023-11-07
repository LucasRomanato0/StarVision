import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/data/datasources/login_datasource.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';
import 'package:mobile/pages/register/data/datasources/register_datasource.dart';

class UserRepositoryImpl implements UserRepository {
  LoginDatasource loginDatasource;
  RegisterDatasource registerDatasource;
  UserRepositoryImpl(this.loginDatasource, this.registerDatasource);

  @override
  Future<Either<Exception, int>> login({
    required String login,
    required String senha,
  }) async {
    try {
      final result = await loginDatasource.login(login: login, senha: senha);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }

  @override
  Future<Either<Exception, int>> register({
    required String login,
    required String email,
    required String phone,
    required String senha,
    required String confirmaSenha,
  }) async {
    try {
      if (senha != confirmaSenha) {
        return Left(Exception('Senhas diferentes'));
      } else {
        final result = await registerDatasource.register(
          login: login,
          email: email,
          phone: phone,
          senha: senha,
          confirmaSenha: confirmaSenha,
        );
        return Right(result);
      }
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
