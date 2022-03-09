import 'package:clean_login/app/modules/login/domain/entities/credentials.dart';
import 'package:clean_login/app/modules/register/domain/entities/adress_entity.dart';
import 'package:clean_login/app/modules/register/infra/models/result_cep.dart';
import 'package:clean_login/app/modules/register/domain/errors/errors.dart';
import 'package:clean_login/app/modules/register/domain/errors/messages.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../../infra/datasource/register_datasource.dart';
part 'datasource_register.g.dart';

@Injectable(singleton: false)
class DataSourceRegisterImpl implements RegisterDataSource {
  final FirebaseAuth auth;
  final FirebaseFirestore firestore;

  DataSourceRegisterImpl({
    required this.auth,
    required this.firestore,
  });

  @override
  Future<String?> createUserEmail({
    required Credentials credentials,
  }) async {
    UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: credentials.email, password: credentials.password);

    if (userCredential.user == null) {
      throw ErrorRegister(
        message: FailureRegisterMessages.Get_Register_User,
      );
    }

    await userCredential.user!.updateDisplayName(credentials.name);
    return auth.currentUser!.uid;
  }

  @override
  Future<ResultCepModel> getRemoteAdress({required String cep}) async {
    try {
      Response result = await http.get(
        Uri.parse(
          "https://viacep.com.br/ws/$cep/json/",
        ),
      );
      return ResultCepModel.fromJson(result.body);
    } catch (e) {
      throw Exception();
    }
  }

  @override
  Future<bool> registerAdress(AdressEntity adress, String uid) async {
    try {
      await firestore.collection("users").doc(uid).set({
        "adress": adress.toMap(),
      });
      return true;
    } catch (e) {
      return false;
    }
  }
}
