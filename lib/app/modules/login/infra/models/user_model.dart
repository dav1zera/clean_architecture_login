import 'package:clean_login/app/modules/login/domain/entities/user.dart';
import 'package:flutter/cupertino.dart';

class UserModel extends UserInfoData {
  UserModel({
    required String name,
    required String uid,
    required String email,
  }) : super(
          name: name,
          uid: uid,
          email: email,
        );

  UserInfoData toLoggedUser() => this;
}
