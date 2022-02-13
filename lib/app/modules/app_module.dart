import 'package:clean_login/app/commons/utils/loading_dialog.dart';
import 'package:clean_login/app/core/connectivity/external/drivers/flutter_connectivity_driver_impl.dart';
import 'package:clean_login/app/core/connectivity/infra/services/connectivity_service_impl.dart';
import 'package:clean_login/app/core/pages/splash_screen_controller.dart';
import 'package:clean_login/app/core/pages/splash_screen_page.dart';
import 'package:clean_login/app/core/stores/auth_store.dart';
import 'package:clean_login/app/modules/home/home_module.dart';
import 'package:clean_login/app/modules/login/login_module.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connectivity/connectivity.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $AuthStore,
        $ConnectivityServiceImpl,
        $FlutterConnectivityDriver,
        $LoadingDialogImpl,
        $SplashScreenController,
        Bind((i) => FirebaseAuth.instance),
        Bind((i) => FirebaseFirestore.instance),
        Bind((i) => Connectivity()),
        ...LoginModule.export,
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (_, __) => const SplashScreenPage()),
        ModuleRoute("/login", module: LoginModule()),
        ModuleRoute("/home", module: HomeModule()),
      ];
}
