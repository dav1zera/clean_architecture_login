import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/register/domain/usecases/get_adress_by_cep.dart';
import 'package:clean_login/app/modules/register/domain/usecases/register_adress.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

import '../../../../../commons/domain/entities/adress_entity.dart';
part 'adress_controller.g.dart';

@Injectable()
class AdressController = _AdressControllerBase with _$AdressController;

abstract class _AdressControllerBase with Store {
  final GetAdressByCepUseCase getAdress;
  final RegisterAdressUseCase registerAdressUseCase;
  final AdressStore store;
  final AuthStore authStore;
  final AuthController authController;
  late String uid;

  _AdressControllerBase(
    this.store,
    this.getAdress,
    this.registerAdressUseCase,
    this.authStore,
    this.authController,
  );

  _callAdressRepository() async {
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

  onTapRegisterAdress() async {
    final adressEntity = AdressEntity(
      cep: store.cepTextController.text,
      rua: store.ruaTextController.text,
      bairro: store.bairroTextController.text,
      complemento: store.compleTextController.text,
      cidade: store.cidadeTextController.text,
      numero: store.numTextController.text,
    );

    final resultAdress = await registerAdressUseCase.call(
      adressEntity: adressEntity,
      uid: uid,
    );

    await resultAdress.fold(
      (failure) => {
        store.statusDescription = failure.message,
      },
      (_) async {
        store.statusDescription = null;
        await authController.checkLogin().then(
          (value) async {
            if (value) {
              await Modular.to.pushReplacementNamed("/home");
            } else {
              await Modular.to.pushReplacementNamed("/login");
            }
          },
        ).onError(
          (error, stackTrace) {
            Modular.to.pushReplacementNamed("/login");
          },
        );
      },
    );
  }

  Future<void> onChangedCep(String value) async {
    final cep = value.replaceAll(RegExp("[^0-9]"), '');
    if (cep.length == 8) {
      await _callAdressRepository();
    }
  }
}
