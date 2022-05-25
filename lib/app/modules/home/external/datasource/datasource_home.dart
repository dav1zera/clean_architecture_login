import 'package:clean_login/app/commons/infra/models/adress_model.dart';
import 'package:clean_login/app/commons/presentation/stores/auth_store.dart';
import 'package:clean_login/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'datasource_home.g.dart';

@Injectable(singleton: false)
class DataSourceHomeImpl implements HomeDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;
  final AuthStore authStore;

  DataSourceHomeImpl(
      {required this.auth, required this.firestore, required this.authStore});

  @override
  Future<AdressModel> getAdressUserData() async {
    DocumentSnapshot<Map<String, dynamic>> user =
        await firestore.collection("users").doc(authStore.user!.uid).get();

    final adress = AdressModel.fromMap(user.data()!["adress"]);
    return adress;
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
