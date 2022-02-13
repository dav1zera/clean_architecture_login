import 'package:clean_login/app/commons/domain/infra/user_model.dart';
import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/login/domain/errors/errors.dart';
import 'package:clean_login/app/modules/login/domain/errors/messages.dart';
import 'package:clean_login/app/modules/login/infra/datasource/login_datasource.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'firebase_datasource_login.g.dart';

@Injectable(singleton: false)
class FireBaseDataSourceLoginImpl implements LoginDataSource {
  final FirebaseAuth auth;

  FireBaseDataSourceLoginImpl(this.auth);

  @override
  Future<UserModel> executeLoginEmail(
      {required Credentials credentials}) async {
    final loginUser = await auth.signInWithEmailAndPassword(
        email: credentials.email, password: credentials.password);

    if (loginUser.user == null) {
      throw ErrorLoginEmail(message: FailureMessages.Error_Login_User);
    }

    return UserModel(
      name: loginUser.user?.displayName ?? "",
      uid: loginUser.user?.uid ?? "",
      email: loginUser.user?.email ?? "",
    );
  }

  @override
  Future<UserModel> currentUser() async {
    final user = (auth.currentUser);

    if (user == null) {
      throw ErrorGetLoggedUser(message: FailureMessages.Error_Get_Logged_User);
    }

    return UserModel(
      name: user.displayName ?? "",
      uid: user.uid,
      email: user.email ?? "",
    );
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
