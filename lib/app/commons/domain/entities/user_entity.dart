import 'package:equatable/equatable.dart';
import 'dart:convert';

class UserEntity extends Equatable {
  final String uid;
  final String name;
  final String email;

  const UserEntity({
    required this.uid,
    required this.name,
    required this.email,
  });

  factory UserEntity.fromJson(String str) => UserEntity.fromJson(
        json.decode(str),
      );

  factory UserEntity.fromMap(Map<String, dynamic> json) => UserEntity(
        email: json["email"] ?? "",
        name: json["name"] ?? "",
        uid: json["uid"],
      );

  String toJson() => json.encode(
        toMap(),
      );

  Map<String, dynamic> toMap() => {
        "email": email,
        "nome": name,
        "uid": uid,
      };

  @override
  List<Object?> get props => [uid, name, email];
}
