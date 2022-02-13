import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/errors/errors.dart';

import 'package:dartz/dartz.dart';

abstract class HomeRepository {
  Future<Either<Failure, UserEntity>> currentUser();
  Future<void> signOut();
}
