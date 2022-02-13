import 'package:clean_login/app/commons/domain/entities/user_entity.dart';
import 'package:clean_login/app/core/errors/errors.dart';
import 'package:clean_login/app/modules/home/domain/repositories/home_repository.dart';
import 'package:clean_login/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'get_user_data.g.dart';

abstract class GetUserDataUseCase {
  Future<Either<Failure, UserEntity>> call();
}

@Injectable(singleton: false)
class GetUserDataUseCaseImpl implements GetUserDataUseCase {
  final HomeDataSource dataSource;
  final HomeRepository repository;

  GetUserDataUseCaseImpl(this.dataSource, this.repository);

  @override
  Future<Either<Failure, UserEntity>> call() async {
    return await repository.currentUser();
  }
}
