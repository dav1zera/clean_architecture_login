import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/infra/models/result_cep.dart';

class AdressMapper {
  static AdressEntity toEntity(ResultCepModel model) {
    return AdressEntity(
      cep: model.cep,
      rua: model.logradouro,
      bairro: model.bairro,
      complemento: model.complemento,
      cidade: model.localidade,
      numero: "",
    );
  }

  static ResultCepModel toModel(AdressEntity entity) {
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
