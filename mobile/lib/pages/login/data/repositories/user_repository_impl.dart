import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/data/datasources/login_datasource.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  LoginDatasource loginDatasource;
  UserRepositoryImpl(this.loginDatasource);

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

  // @override
  // Future<Either<Exception, int>> cadastro({
  //   required String login,
  //   required String email,
  //   required String phone,
  //   required String senha,
  // }) async {
  //   try {
  //     final result = await cadastroDatasource.cadastro(
  //       login: login,
  //       email: email,
  //       phone: phone,
  //       senha: senha,
  //     );
  //     return Right(result);
  //   } catch (e) {
  //     return Left(Exception(e));
  //   }
  // }
}
