import 'package:clean_login/app/core/stores/auth_store.dart';

class HomeController {
  final AuthStore authStore;

  HomeController({
    required this.authStore,
  });

  onTapLogout() {
    authStore.signOut();
  }
}
