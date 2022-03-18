import 'package:clean_login/app/core/stores/auth_store.dart';
import 'package:clean_login/app/modules/home/domain/usecases/get_user_data.dart';
import 'package:clean_login/app/modules/home/presentation/home_store.dart';

class HomeController {
  final AuthStore authStore;
  final GetUserDataUseCase getUserDataUseCase;
  final HomeStore store;

  HomeController({
    required this.getUserDataUseCase,
    required this.authStore,
    required this.store,
  });

  getInfoUser() async {
    store.isLoading.value = true;
    final resultAdress = await getUserDataUseCase.call();
    resultAdress.fold(
      (failure) {
        store.hasError = true;
      },
      (_) {},
    );
    store.isLoading.value = false;
  }

  onTapLogout() {
    authStore.signOut();
  }
}
