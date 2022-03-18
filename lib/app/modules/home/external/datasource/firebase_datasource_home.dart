import 'package:clean_login/app/commons/domain/infra/adress_model.dart';
import 'package:clean_login/app/modules/home/infra/datasource/home_datasource.dart';
import 'package:clean_login/main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
part 'firebase_datasource_home.g.dart';

@Injectable(singleton: false)
class FirebaseDataSourceHomeImpl implements HomeDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  FirebaseDataSourceHomeImpl({
    required this.auth,
    required this.firestore,
  });

  @override
  Future<AdressModel> getAdressUserData() async {
    DocumentSnapshot<Map<String, dynamic>> user = await firestore
        .collection("users")
        .doc(sessionStore.userInfoData!.uid)
        .get();

    final adress = AdressModel.fromMap(user.data()!["adress"]);
    return adress;
  }

  @override
  Future<void> logout() async {
    await auth.signOut();
  }
}
