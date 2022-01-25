import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:clean_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:clean_login/app/modules/login/domain/usecases/logout.dart';
import 'package:clean_login/app/modules/login/external/datasource/firebase_datasource_login.dart';
import 'package:clean_login/app/modules/login/infra/repositories/login_repository_impl.dart';
import 'package:clean_login/app/modules/login/presentation/login_controller.dart';
import 'package:clean_login/app/modules/login/presentation/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> binds = [
    $LoginWithEmailUseCaseImpl,
    $LoginRepositoryImpl,
    $GetLoggedUserUseCaseImpl,
    $FireBaseDataSourceLoginImpl,
    $LoginController,
    $LogoutImpl
  ];
  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => const LoginPage()),
      ];
}
