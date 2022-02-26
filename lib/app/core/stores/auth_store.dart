import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:clean_login/app/modules/login/domain/usecases/logout.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
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
  UserEntity? user;

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(UserEntity value) => user = value;

  Future<bool> checkLogin() async {
    final result = await getLoggedUser();
    return result.fold(
      (l) {
        return false;
      },
      (resultUserEntity) {
        user = resultUserEntity;
        return true;
      },
    );
  }

  Future signOut() async {
    var result = await logout();
    result.fold(
      (l) {
        asuka.showSnackBar(
          SnackBar(
            content: Text(l.message),
          ),
        );
      },
      (_) {
        user = null;
        Modular.to.pushNamedAndRemoveUntil("/login", (_) => false);
      },
    );
  }
}
