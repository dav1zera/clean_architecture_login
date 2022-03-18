import 'package:clean_login/app/modules/home/home_controller.dart';
import 'package:clean_login/app/modules/home/home_page.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeModule extends Module {
  @override
  List<Bind> get binds => [
        Bind.factory(
          (i) => HomeController(
            authStore: i(),
            getUserDataUseCase: i(),
            store: i(),
          ),
        )
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute("/", child: (context, args) => HomePage()),
      ];
}
