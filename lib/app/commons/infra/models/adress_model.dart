import 'dart:convert';

import 'package:equatable/equatable.dart';

class AdressModel extends Equatable {
  final String cep;
  final String rua;
  final String bairro;
  final String complemento;
  final String cidade;
  final String numero;

  AdressModel({
    required this.cep,
    required this.rua,
    required this.bairro,
    required this.complemento,
    required this.cidade,
    required this.numero,
  });

  factory AdressModel.fromJson(String str) =>
      AdressModel.fromMap(json.decode(str));

  factory AdressModel.fromMap(Map<String, dynamic> json) => AdressModel(
        cep: json["cep"],
        rua: json["rua"],
        bairro: json["bairro"],
        complemento: json["complemento"],
        cidade: json["cidade"],
        numero: json["numero"],
      );

  String toJson() => json.encode(
        toMap(),
      );

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "rua": rua,
        "complemento": complemento,
        "bairro": bairro,
        "cidade": cidade,
        "numero": numero
      };

  @override
  List<Object?> get props => [
        cep,
        rua,
        bairro,
        complemento,
        cidade,
        numero,
      ];
}
