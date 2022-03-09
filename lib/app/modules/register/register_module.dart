import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:clean_login/app/modules/login/presentation/login_page.dart';
import 'package:clean_login/app/modules/register/domain/usecases/create_user_email.dart';
import 'package:clean_login/app/modules/register/domain/usecases/get_adress_by_cep.dart';
import 'package:clean_login/app/modules/register/domain/usecases/register_adress.dart';
import 'package:clean_login/app/modules/register/external/datasource/datasource_register.dart';
import 'package:clean_login/app/modules/register/infra/repositories/register_repository_impl.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_controller.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_page.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_store.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_controller.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_page.dart';
import 'package:clean_login/app/modules/register/presentation/pages/user/register_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  //Binds

  @override
  List<Bind> binds = [
    $RegisterRepositoryImpl,
    $RegisterAdressUseCaseImpl,
    $DataSourceRegisterImpl,
    $GetRegisterAdressUseCaseImpl,
    $CreateUserEmailUseCaseImpl,
    $RegisterStore,
    $RegisterController,
    $AdressController,
    $AdressStore,
  ];

  //Rotas

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const RegisterPage(),
        ),
        ChildRoute(
          "/adress",
          child: (context, args) => AdressPage(uid: args.data),
        ),
      ];
}
