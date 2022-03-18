import 'package:clean_login/app/commons/domain/infra/adress_model.dart';

abstract class HomeDataSource {
  Future<AdressModel> getAdressUserData();
  Future<void> logout();
}
