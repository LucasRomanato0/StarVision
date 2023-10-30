import 'package:dartz/dartz.dart';
import 'package:mobile/pages/login/data/datasources/login_datasource.dart';
import 'package:mobile/pages/login/domain/entities/user_entity.dart';
import 'package:mobile/pages/login/domain/repositories/login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  LoginDatasource datasource;
  LoginRepositoryImpl(this.datasource);

  @override
  Future<Either<Exception, UserEntity>> login({
    required String login,
    required String senha,
  }) async {
    try {
      final result = await datasource.login(login: login, senha: senha);
      return Right(result);
    } catch (e) {
      return Left(Exception(e));
    }
  }
}
