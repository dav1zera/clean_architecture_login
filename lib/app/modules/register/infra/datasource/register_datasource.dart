import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/entities/result_cep.dart';

abstract class RegisterDataSource {
  Future<String?> createUserEmail({required Credentials credentials});
  Future<ResultCep> getAdress(String cep);
  Future<bool> registerAdressFirestore(AdressEntity adress, String uid);
}
