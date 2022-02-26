import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/usecases/get_adress.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_store.dart';

import 'package:mobx/mobx.dart';

abstract class AdressController with Store {
  final GetAdressUseCase getAdress;
  final AdressStore store;

  AdressController(
    this.store,
    this.getAdress,
  );

  callAdressRepository() async {
    store.isLoading.value = true;

    final result = await getAdress.call(cep: store.cepTextController.text);
    result.fold(
      (failure) {
        store.hasError = true;
      },
      (adress) {
        store.cepTextController.text = adress.cep;
        store.ruaTextController.text = adress.rua;
        store.bairroTextController.text = adress.bairro;
        store.cidadeTextController.text = adress.cidade;
      },
    );

    store.isLoading.value = false;
  }

  onTapRegisterAdress(context) async {
    final adressEntity = AdressEntity(
      cep: store.cepTextController.text,
      rua: store.ruaTextController.text,
      bairro: store.bairroTextController.text,
      complemento: store.compleTextController.text,
      cidade: store.cidadeTextController.text,
      numero: store.numTextController.text,
    );
  }

  void onChangedCep(String value) {
    final cep = value.replaceAll(RegExp("[^0-9]"), '');
    if (cep.length == 8) {
      callAdressRepository();
    }
  }
}
