import 'package:clean_login/app/commons/domain/entities/adress_entity.dart';
import 'package:clean_login/app/commons/domain/errors/errors.dart';
import 'package:clean_login/app/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_login/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'get_user_data.g.dart';

abstract class GetUserDataUseCase {
  Future<Either<Failure, AdressEntity>> call();
}

@Injectable(singleton: false)
class GetUserDataUseCaseImpl implements GetUserDataUseCase {
  final HomeDataSource dataSource;
  final HomeRepository repository;

  GetUserDataUseCaseImpl(this.dataSource, this.repository);

  @override
  Future<Either<Failure, AdressEntity>> call() async {
    return await repository.currentUser();
  }
}
