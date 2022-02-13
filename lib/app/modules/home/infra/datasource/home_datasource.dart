import 'package:clean_login/app/commons/domain/infra/user_model.dart';

abstract class HomeDataSource {
  Future<UserModel> getHomeUserData();
  Future<void> logout();
}
