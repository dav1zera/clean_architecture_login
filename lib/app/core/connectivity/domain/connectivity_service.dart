import 'package:clean_login/app/core/errors/errors.dart';
import 'package:dartz/dartz.dart';

abstract class ConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
