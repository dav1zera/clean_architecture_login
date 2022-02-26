import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:dartz/dartz.dart';

abstract class GetAdressUseCase {
  Future<Either<Failure, AdressEntity>> call({required String cep});
}

class GetRegisterAdressUseCaseImpl implements GetAdressUseCase {
  final RegisterRepository repository;

  GetRegisterAdressUseCaseImpl(this.repository);

  @override
  Future<Either<Failure, AdressEntity>> call({required String cep}) {
    throw UnimplementedError();
  }
}
