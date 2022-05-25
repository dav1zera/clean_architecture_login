import 'package:clean_login/app/commons/infra/models/adress_model.dart';

abstract class HomeDataSource {
  Future<AdressModel> getAdressUserData();
  Future<void> logout();
}
