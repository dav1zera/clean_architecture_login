import 'package:clean_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        $LoginWithEmailImpl,
      ];
  @override
  List<ModularRoute> get routes => [];
}
