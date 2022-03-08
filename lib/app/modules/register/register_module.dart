import 'package:clean_login/app/modules/login/presentation/login_page.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  static List<Bind> export = [];

  //Binds

  @override
  List<Bind> binds = [];

  //Rotas

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => const LoginPage(),
        ),
        ChildRoute(
          "/adress",
          child: (context, args) => AdressPage(uid: args.data),
        ),
      ];
}
