import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../commons/domain/entities/adress_entity.dart';
part 'get_adress_by_cep.g.dart';

abstract class GetAdressByCepUseCase {
  Future<Either<Failure, AdressEntity>> call({required String cep});
}

@Injectable(singleton: false)
class GetRegisterAdressUseCaseImpl implements GetAdressByCepUseCase {
  final RegisterRepository repository;

  GetRegisterAdressUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, AdressEntity>> call({
    required String cep,
  }) {
    return repository.getAdress(cep: cep);
  }
}
