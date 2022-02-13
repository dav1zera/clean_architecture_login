import 'package:clean_login/app/modules/login/presentation/login_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class RegisterModule extends Module {
  static List<Bind> export = [];

  //Binds

  @override
  List<Bind> binds = [];

  //Rotas

  @override
  List<ModularRoute> get routes =>
      [ChildRoute("/", child: (context, args) => const LoginPage())];
}
