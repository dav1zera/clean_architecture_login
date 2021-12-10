import 'package:clean_login/app/modules/login/infra/models/user_model.dart';

abstract class LoginDataSource {
  Future<UserModel> executeLoginEmail();
  Future<UserModel> currentUser();
  Future<void> logout();
}
