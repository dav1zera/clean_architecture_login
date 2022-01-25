import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:clean_login/app/modules/login/domain/usecases/logout.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  final GetLoggedUserUseCase getLoggedUser;
  final Logout logout;

  _AuthStoreBase(this.getLoggedUser, this.logout);

  @observable
  late LoggedUserInfo user;

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(Credentials credentials) => user;

  Future<bool> checkLogin(Credentials credentials) async {
    final result = await getLoggedUser();
    return result.fold(
      (l) {
        return false;
      },
      (user) {
        setUser(credentials);
        return true;
      },
    );
  }

  Future signOut(Credentials credentials) async {
    var result = await logout();
    result.fold(
      (l) {
        asuka.showSnackBar(
          SnackBar(
            content: Text(l.message),
          ),
        );
      },
      (r) {
        setUser(credentials);
        Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
      },
    );
  }
}
