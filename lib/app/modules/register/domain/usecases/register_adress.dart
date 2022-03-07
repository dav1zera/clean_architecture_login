import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/errors/messages.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../core/errors/errors.dart';
part 'register_adress.g.dart';

abstract class RegisterAdressUseCase {
  Future<Either<Failure, Unit>> call({
    required AdressEntity adressEntity,
    required String uid,
  });
}

@Injectable(singleton: false)
class RegisterAdressUseCaseImpl implements RegisterAdressUseCase {
  final RegisterRepository repository;

  RegisterAdressUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, Unit>> call({
    required AdressEntity adressEntity,
    required String uid,
  }) async {
    if (adressEntity.cep.isNotEmpty) {
      return Left(
        ErrorAdress(
          message: FailureRegisterMessages.Invalid_Cep,
        ),
      );
    }

    if (adressEntity.bairro.isNotEmpty) {
      return Left(
        ErrorAdress(
          message: FailureRegisterMessages.Invalid_District,
        ),
      );
    }

    if (adressEntity.cidade.isNotEmpty) {
      return Left(
        ErrorAdress(
          message: FailureRegisterMessages.Invalid_City,
        ),
      );
    }

    if (adressEntity.complemento.isNotEmpty) {
      return Left(
        ErrorAdress(
          message: FailureRegisterMessages.Invalid_Complement,
        ),
      );
    }

    if (adressEntity.numero.isNotEmpty) {
      return Left(
        ErrorAdress(
          message: FailureRegisterMessages.Invalid_Number,
        ),
      );
    }

    if (adressEntity.rua.isNotEmpty) {
      return Left(
        ErrorAdress(
          message: FailureRegisterMessages.Invalid_Street,
        ),
      );
    }

    return await repository.registerAdress(
      adressEntity: adressEntity,
      uid: uid,
    );
  }
}
