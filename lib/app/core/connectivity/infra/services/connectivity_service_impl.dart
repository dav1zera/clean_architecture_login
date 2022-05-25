import 'package:clean_login/app/core/connectivity/domain/connectivity_service.dart';
import 'package:clean_login/app/core/connectivity/domain/errors/errors.dart';
import 'package:clean_login/app/core/connectivity/infra/drivers/connectivity_driver.dart';
import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:clean_login/app/commons/domain/errors/messages.dart';

import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'connectivity_service_impl.g.dart';

@Injectable(singleton: false)
class ConnectivityServiceImpl implements ConnectivityService {
  final ConnectivityDriver driver;

  ConnectivityServiceImpl(this.driver);

  @override
  Future<Either<Failure, Unit>> isOnline() async {
    try {
      final check = await driver.isOnline;
      if (check) {
        return const Right(unit);
      }
      throw ErrorConnection(message: Messages.Offline_Connection);
    } on Failure catch (e) {
      return Left(e);
    } catch (e) {
      return Left(
        ErrorConnection(
          message: Messages.Failed_Connection,
        ),
      );
    }
  }
}
