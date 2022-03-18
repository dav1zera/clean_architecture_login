import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';

import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, AdressEntity>> currentUser();
  Future<void> signOut();
}
