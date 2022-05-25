import 'package:clean_login/app/commons/helpers/asuka_helper.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
import '../../../modules/login/domain/usecases/logout.dart';

part 'auth_controller.g.dart';

@Injectable()
class AuthController = _AuthControllerBase with _$AuthController;

abstract class _AuthControllerBase with Store {
  final AsukaHelper asukaHelper;
  final AuthStore store;
  final GetLoggedUserUseCase getLoggedUser;
  final Logout logout;

  _AuthControllerBase(
    this.store,
    this.getLoggedUser,
    this.logout,
    this.asukaHelper,
  );

  Future<bool> checkLogin() async {
    final result = await getLoggedUser();
    return result.fold(
      (failure) {
        return false;
      },
      (resultUserEntity) {
        store.user = resultUserEntity;
        return true;
      },
    );
  }

  Future signOut() async {
    var result = await logout();
    result.fold(
      (failure) {
        asukaHelper.showSnackBar(
          failure.message,
        );
      },
      (_) {
        store.user = null;
        Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
      },
    );
  }
}
