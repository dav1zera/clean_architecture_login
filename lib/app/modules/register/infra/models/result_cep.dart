import 'dart:convert';

class ResultCepModel {
  final String cep;
  final String localidade;
  final String complemento;
  final String bairro;
  final String uf;
  final String logradouro;

  ResultCepModel({
    required this.cep,
    required this.localidade,
    required this.complemento,
    required this.bairro,
    required this.uf,
    required this.logradouro,
  });

  factory ResultCepModel.fromJson(String str) =>
      ResultCepModel.fromMap(json.decode(str));

  factory ResultCepModel.fromMap(Map<String, dynamic> json) => ResultCepModel(
        cep: json["cep"],
        logradouro: json["logradouro"] ?? "",
        complemento: json["complemento"] ?? "",
        bairro: json["bairro"] ?? "",
        localidade: json["localidade"] ?? "",
        uf: json["uf"] ?? "",
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "logradouro": logradouro,
        "complemento": complemento,
        "bairro": bairro,
        "localidade": localidade,
        "uf": uf,
      };
}
