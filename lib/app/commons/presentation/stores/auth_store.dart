import 'package:clean_login/app/commons/domain/entities/user_entity.dart';

import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'auth_store.g.dart';

@Injectable()
class AuthStore = _AuthStoreBase with _$AuthStore;

abstract class _AuthStoreBase with Store {
  @observable
  UserEntity? user;

  @computed
  bool get isLogged => user != null;

  @action
  void setUser(UserEntity value) => user = value;
}
