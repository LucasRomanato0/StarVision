import 'package:get_it/get_it.dart';
import 'package:mobile/pages/login/data/datasources/login_datasource.dart';
import 'package:mobile/pages/login/data/repositories/user_repository_impl.dart';
import 'package:mobile/pages/login/domain/repositories/user_repository.dart';
import 'package:mobile/pages/login/domain/usecases/login_usecase.dart';
import 'package:mobile/pages/login/external/login_datasource_impl.dart';
import 'package:mobile/pages/login/ui/controllers/login_controller.dart';
import 'package:mobile/pages/register/data/datasources/register_datasource.dart';
import 'package:mobile/pages/register/domain/usecases/register_usecase.dart';
import 'package:mobile/pages/register/external/register_datasource_impl.dart';
import 'package:mobile/pages/register/ui/controllers/register_controller.dart';

class DependenceInjectionSetup {
  static GetIt getIt = GetIt.instance;

  static void init() {
    // Datasources
    getIt.registerLazySingleton<LoginDatasource>(() => LoginDatasourceImpl());
    getIt.registerLazySingleton<RegisterDatasource>(
      () => RegisterDatasourceImpl(),
    );

    // Repositories
    getIt.registerLazySingleton<UserRepository>(
      () => UserRepositoryImpl(getIt.get(), getIt.get()),
    );

    // Usecases
    getIt.registerLazySingleton<LoginUsecase>(
      () => LoginUsecaseImpl(getIt.get()),
    );
    getIt.registerLazySingleton<RegisterUsecase>(
      () => RegisterUsecaseImpl(getIt.get()),
    );

    // Controllers
    getIt.registerFactory(() => LoginController(getIt.get()));
    getIt.registerFactory(() => RegisterController(getIt.get()));
  }
}
