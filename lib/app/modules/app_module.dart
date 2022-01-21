import 'package:clean_login/app/core/pages/splash_screen_page.dart';
import 'package:clean_login/app/modules/login/login_module.dart';
import 'package:clean_login/app/modules/login/presentation/login_page.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Connectivity()),
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => Connectivity())
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (_, __) => SplashScreenPage(),
        ),
        ModuleRoute(
          "/login",
          module: LoginModule(),
        ),
      ];
}
