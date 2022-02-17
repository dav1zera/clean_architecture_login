import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/commons/domain/infra/user_model.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/entities/result_cep.dart';

class AdressMapper {
  static AdressEntity toEntity(ResultCep model) {
    return AdressEntity(
      cep: model.cep,
      rua: model.logradouro,
      bairro: model.bairro,
      complemento: model.complemento,
      cidade: model.localidade,
      numero: "",
    );
  }

  static ResultCep toModel(AdressEntity entity) {
    return ResultCep(
      cep: entity.cep,
      localidade: entity.cidade,
      complemento: entity.complemento,
      bairro: entity.bairro,
      uf: entity.numero,
      logradouro: entity.rua,
    );
  }
}
