import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/repositories/register_repository.dart';
import 'package:clean_login/app/modules/register/infra/datasource/register_datasource.dart';
import 'package:dartz/dartz.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterDataSource dataSource;

  RegisterRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, UserEntity>> createUserEmail(
      {required Credentials credentials}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, UserEntity>> currentUser() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, AdressEntity>> getAdress() {
    throw UnimplementedError();
  }
}
