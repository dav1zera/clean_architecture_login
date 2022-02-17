import 'dart:convert';

class AdressEntity {
  final String cep;
  final String rua;
  final String bairro;
  final String complemento;
  final String cidade;
  final String numero;

  AdressEntity({
    required this.cep,
    required this.rua,
    required this.bairro,
    required this.complemento,
    required this.cidade,
    required this.numero,
  });

  factory AdressEntity.fromJson(String str) =>
      AdressEntity.fromMap(json.decode(str));

  factory AdressEntity.fromMap(Map<String, dynamic> json) => AdressEntity(
        cep: json["cep"] ?? "",
        rua: json["rua"] ?? "",
        complemento: json["complemento"] ?? "",
        bairro: json["bairro"] ?? "",
        cidade: json["cidade"] ?? "",
        numero: json["numero"] ?? "",
      );

  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "cep": cep,
        "rua": rua,
        "complemento": complemento,
        "bairro": bairro,
        "cidade": cidade,
      };
}
