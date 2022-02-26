import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:clean_login/app/modules/register/infra/datasource/register_datasource.dart';
import 'package:clean_login/app/modules/register/infra/mappers/adress_mapper.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);

  @override
  Future<Either<Failure, AdressEntity>> getAdress({
    required String cep,
  }) async {
    try {
      final resultCep = await dataSource.getRemoteAdress(
        cep: cep,
      );

      final userEntity = AdressMapper.toEntity(resultCep);
      return Right(userEntity);
    } catch (e) {
      return Left(
        ErrorAdress(
          message: FailureMessages.Invalid_Adress,
        ),
      );
    }
  }

  @override
  Future<Either<Failure, String>> createUserEmail({
    required Credentials credentials,
  }) async {
    try {
      final uid = await dataSource.createUserEmail(credentials: credentials);
      if (uid == null) {
        return Left(
          ErrorRegister(
            message: FailureMessages.Error_Create_User,
          ),
        );
      }
      return Right(uid);
    } catch (e) {
      return Left(
        ErrorRegister(
          message: FailureMessages.Error_Create_User,
        ),
      );
    }
  }
}
