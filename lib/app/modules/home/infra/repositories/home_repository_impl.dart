import 'package:clean_login/app/commons/domain/mappers/user_mapper.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/home/domain/errors/errors.dart';
import 'package:clean_login/app/modules/home/domain/errors/messages.dart';
import 'package:clean_login/app/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_login/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/infra/mappers/adress_mapper.dart';
import 'package:dartz/dartz.dart';

class HomeRepositoryImpl implements HomeRepository {
  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);
  @override
  Future<Either<Failure, AdressEntity>> currentUser() async {
    try {
      final adressModel = await dataSource.getAdressUserData();
      final adressEntity = AdressMapper.toEntity(adressModel);
      return Right(adressEntity);
    } catch (e) {
      return Left(
        ErrorGetCurrentUser(message: FailureHomeMessages.Get_Current_User),
      );
    }
  }

  @override
  Future<void> signOut() async {
    await dataSource.logout();
  }
}
