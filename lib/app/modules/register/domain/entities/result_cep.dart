import 'dart:convert';

class ResultCep {
  final String cep;
  final String localidade;
  final String complemento;
  final String bairro;
  final String uf;
  final String logradouro;

  ResultCep({
    required this.cep,
    required this.localidade,
    required this.complemento,
    required this.bairro,
    required this.uf,
    required this.logradouro,
  });

  factory ResultCep.fromJson(String str) => ResultCep.fromMap(json.decode(str));

  factory ResultCep.fromMap(Map<String, dynamic> json) => ResultCep(
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
