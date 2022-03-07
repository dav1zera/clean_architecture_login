import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/infra/models/result_cep.dart';

abstract class RegisterDataSource {
  Future<String?> createUserEmail({required Credentials credentials});
  Future<ResultCepModel> getRemoteAdress({required String cep});
  Future<bool> registerAdress(AdressEntity adressEntity, String uid);
}
