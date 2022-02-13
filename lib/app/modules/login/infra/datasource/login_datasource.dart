import 'package:clean_login/app/commons/domain/infra/user_model.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';

import 'dart:async';

abstract class LoginDataSource {
  Future<UserModel> executeLoginEmail({required Credentials credentials});
  Future<UserModel> currentUser();
  Future<void> logout();
}
