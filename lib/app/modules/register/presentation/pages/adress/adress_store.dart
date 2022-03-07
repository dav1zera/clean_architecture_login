import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'adress_store.g.dart';

@Injectable()
class AdressStore = _AdressStoreBase with _$AdressStore;

abstract class _AdressStoreBase with Store {
  final ValueNotifier<bool> isLoading = ValueNotifier(false);

  bool hasError = false;
  TextEditingController ruaTextController = TextEditingController();
  TextEditingController cepTextController = TextEditingController();
  TextEditingController bairroTextController = TextEditingController();
  TextEditingController cidadeTextController = TextEditingController();
  TextEditingController numTextController = TextEditingController();
  TextEditingController compleTextController = TextEditingController();

  @observable
  String? statusDescription;
}
