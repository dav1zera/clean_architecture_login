import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/domain/usecases/get_adress_by_cep.dart';
import 'package:clean_login/app/modules/register/domain/usecases/register_adress.dart';
import 'package:clean_login/app/modules/register/presentation/pages/adress/adress_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'adress_controller.g.dart';

@Injectable()
class AdressController = _AdressControllerBase with _$AdressController;

abstract class _AdressControllerBase with Store {
  final GetAdressByCepUseCase getAdress;
  final RegisterAdressUseCase registerAdressUseCase;
  final AdressStore store;
  String? uid;

  _AdressControllerBase(
    this.store,
    this.getAdress,
    this.registerAdressUseCase,
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

    final resultAdress =
        await registerAdressUseCase.call(adressEntity: adressEntity, uid: uid!);

    resultAdress.fold(
      (failure) => {
        store.statusDescription = failure.message,
      },
      (_) {
        store.statusDescription = null;
        Modular.to.pushNamedAndRemoveUntil("/home", (_) => false);
      },
    );
  }

  void onChangedCep(String value) {
    final cep = value.replaceAll(RegExp("[^0-9]"), '');
    if (cep.length == 8) {
      callAdressRepository();
    }
  }
}
