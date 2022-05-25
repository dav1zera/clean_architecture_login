import 'package:clean_login/app/commons/presentation/controllers/auth_controller.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/home/domain/usecases/get_user_data.dart';
import 'package:clean_login/app/modules/home/presentation/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';
part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final AuthStore authStore;
  final GetUserDataUseCase getUserDataUseCase;
  final HomeStore store;
  final AuthController authController;

  _HomeControllerBase({
    required this.getUserDataUseCase,
    required this.authStore,
    required this.store,
    required this.authController,
  });

  getInfoUser() async {
    store.isLoading.value = true;
    final resultAdress = await getUserDataUseCase.call();
    resultAdress.fold(
      (failure) {
        store.hasError = true;
      },
      (adress) {
        store.adress = adress;
      },
    );
    store.isLoading.value = false;
  }

  onTapLogout() {
    authController.signOut();
  }
}
