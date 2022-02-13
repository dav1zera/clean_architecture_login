import 'package:clean_login/app/commons/domain/entities/user_entity.dart';

class ControllerSession {
  UserEntity? userInfoData;

  get isLogged => userInfoData != null;
}
