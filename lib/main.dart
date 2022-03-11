import 'package:clean_login/app/commons/controller/controller_session.dart';
import 'package:clean_login/app/modules/app_module.dart';
import 'package:clean_login/app/modules/app_widget.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

//flutter pub run build_runner build => injeções de binds
//Main ponto de partida

/*

ControllerSession => pega a sessão do usuário logado, através do userInfoData

*/

ControllerSession sessionStore = ControllerSession();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    ModularApp(
      module: AppModule(),
      child: const AppWidget(),
    ),
  );
}
