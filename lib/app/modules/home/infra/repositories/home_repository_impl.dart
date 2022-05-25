import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:clean_login/app/modules/home/domain/errors/errors.dart';
import 'package:clean_login/app/modules/home/domain/errors/messages.dart';
import 'package:clean_login/app/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_login/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:clean_login/app/modules/register/infra/mappers/adress_mapper.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../../../commons/domain/entities/adress_entity.dart';

part 'home_repository_impl.g.dart';

@Injectable(singleton: false)
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
