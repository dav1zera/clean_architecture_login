import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../commons/domain/entities/adress_entity.dart';

part 'home_store.g.dart';

@Injectable()
class HomeStore = _HomeStoreBase with _$HomeStore;

abstract class _HomeStoreBase with Store {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);
  bool hasError = false;

  //uid, nome, email, cep, cidade, rua

  @observable
  AdressEntity? adress;
}
