import 'package:clean_login/app/commons/utils/loading_dialog.dart';
import 'package:clean_login/app/core/stores/auth_store.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/usecases/login_with_email.dart';
import 'package:asuka/asuka.dart' as asuka;
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx/mobx.dart';

part 'login_controller.g.dart';

@Injectable()
class LoginController = _LoginControllerBase with _$LoginController;

abstract class _LoginControllerBase with Store {
  //final LoginWithEmailUseCase loginWithEmail;
  //final LoadingDialog loadingDialog;
  //final AuthStore authStore;

  _LoginControllerBase();

  enterLoginEmail(Credentials credentials) async {
    // loadingDialog.show();
    await Future.delayed(
      const Duration(milliseconds: 500),
    );
    //final result = await loginWithEmail(credentials);
    //await loadingDialog.hide();
    // result.fold(
    //   (failure) {
    //     asuka.showSnackBar(
    //       SnackBar(
    //         content: Text(failure.message),
    //         duration: const Duration(seconds: 2),
    //       ),
    //     );
    //   },
    //   (user) {
    //     authStore.setUser(credentials);
    //     Modular.to.pushNamedAndRemoveUntil('/', (_) => false);
    //   },
    // );
  }
}
