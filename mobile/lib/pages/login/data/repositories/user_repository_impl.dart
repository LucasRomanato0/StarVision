import 'package:dartz/dartz.dart';
import 'package:mobile/pages/register/data/datasources/cadastro_datasource.dart';
import 'package:mobile/pages/login/data/datasources/login_datasource.dart';
import 'package:mobile/pages/login/domain/entities/user_entity.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  LoginDatasource loginDatasource;
  CadastroDatasource cadastroDatasource;
  UserRepositoryImpl(this.loginDatasource, this.cadastroDatasource);

  @override
  Future<Either<Exception, UserEntity>> login({
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
  Future<Either<Exception, UserEntity>> cadastro({
    required String login,
    required String email,
    required String phone,
    required String senha,
  }) async {
    try {
      final result = await cadastroDatasource.cadastro(
        login: login,
        email: email,
        phone: phone,
        senha: senha,
      );
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
