import 'package:clean_login/app/modules/home/domain/usecases/get_user_data.dart';
import 'package:clean_login/app/modules/home/external/datasource/datasource_home.dart';
import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:clean_login/app/modules/home/home_page.dart';
import 'package:clean_login/app/modules/home/infra/repositories/home_repository_impl.dart';
import 'package:clean_login/app/modules/home/presentation/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        $HomeController,
        $HomeStore,
        $HomeRepositoryImpl,
        $DataSourceHomeImpl,
        $GetUserDataUseCaseImpl
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          "/",
          child: (context, args) => HomePage(),
        ),
      ];
}
