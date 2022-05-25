import 'package:clean_login/app/commons/domain/errors/errors.dart';

import 'package:dartz/dartz.dart';

import '../../../../commons/domain/entities/adress_entity.dart';

abstract class HomeRepository {
  Future<Either<Failure, AdressEntity>> currentUser();
  Future<void> signOut();
}
