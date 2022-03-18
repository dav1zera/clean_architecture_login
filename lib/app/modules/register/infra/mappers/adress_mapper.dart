import 'package:clean_login/app/commons/domain/infra/adress_model.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/infra/models/result_cep.dart';

class AdressMapper {
  static AdressEntity toEntityByCep(ResultCepModel model) {
    return AdressEntity(
      cep: model.cep,
      rua: model.logradouro,
      bairro: model.bairro,
      complemento: model.complemento,
      cidade: model.localidade,
      numero: "",
    );
  }

  static AdressModel toModel(AdressEntity entity) {
    return AdressModel(
      cep: entity.cep,
      cidade: entity.cidade,
      complemento: entity.complemento,
      bairro: entity.bairro,
      numero: entity.numero,
      rua: entity.rua,
    );
  }

  static AdressEntity toEntity(AdressModel model) {
    return AdressEntity(
      cep: model.cep,
      rua: model.rua,
      bairro: model.bairro,
      complemento: model.complemento,
      cidade: model.cidade,
      numero: "",
    );
  }

  static ResultCepModel toModelByCep(AdressEntity entity) {
    return ResultCepModel(
      cep: entity.cep,
      localidade: entity.cidade,
      complemento: entity.complemento,
      bairro: entity.bairro,
      uf: entity.numero,
      logradouro: entity.rua,
    );
  }
}
