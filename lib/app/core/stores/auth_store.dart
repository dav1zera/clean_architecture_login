import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/entities/logged_user_info.dart';
import 'package:clean_login/app/modules/login/domain/usecases/get_logged_user.dart';
import 'package:clean_login/app/modules/login/domain/usecases/logout.dart';

import 'package:mobx/mobx.dart';

abstract class AuthStore {
  final GetLoggedUserUseCase getLoggedUser;
  final Logout logout;

  AuthStore(this.getLoggedUser, this.logout);

  @observable
  late LoggedUserInfo user;

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(Credentials credentials) => user;
}
