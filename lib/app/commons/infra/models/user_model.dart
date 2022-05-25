import 'dart:convert';

import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;

  const UserModel({required this.uid, required this.name, required this.email});

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
      uid: json["uid"], name: json["nome"] ?? "", email: json["email"] ?? "");

  String toJson() => json.encode(
        toMap(),
      );

  Map<String, dynamic> toMap() => {
        "uid": uid,
        "nome": name,
        "email": email,
      };

  @override
  List<Object?> get props => [uid, name, email];
}
