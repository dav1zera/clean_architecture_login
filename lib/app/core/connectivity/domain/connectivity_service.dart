import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
