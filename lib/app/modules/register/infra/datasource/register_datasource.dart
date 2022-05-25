import 'package:clean_login/app/commons/infra/models/adress_model.dart';
import 'package:clean_login/app/commons/infra/models/user_model.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/infra/models/result_cep.dart';

abstract class RegisterDataSource {
  Future<UserModel> createUserEmail({required Credentials credentials});
  Future<ResultCepModel> getRemoteAdress({required String cep});
  Future<bool> registerAdress(AdressModel adress, String uid);
}
