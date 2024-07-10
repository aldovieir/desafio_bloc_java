import 'dart:convert';

// ignore: must_be_immutable
class Register {
  Register({
    this.id,
    this.cpf,
    this.motherName,
    this.birthDate,
    this.genre,
    this.isDeleting = false,
  });

  String? id;
  String? cpf;
  String? motherName;
  DateTime? birthDate;
  String? genre;

  bool isDeleting;

  Register copyWith({
    String? id,
    String? cpf,
    String? motherName,
    DateTime? birthDate,
    String? genre,
    bool? isDeleting,
  }) {
    return Register(
      id: id ?? this.id,
      cpf: cpf ?? this.cpf,
      motherName: motherName ?? this.motherName,
      birthDate: birthDate ?? this.birthDate,
      genre: genre ?? this.genre,
      isDeleting: isDeleting ?? this.isDeleting,
    );
  }

  factory Register.fromJson(String str) => Register.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Register.fromMap(Map<String, dynamic> json) {
    return Register(
        id: json["id"] == null ? null : json["id"],
        cpf: json["cpf"] == null ? null : json["cpf"],
        motherName: json["nome_mae"] == null ? null : json["nome_mae"],
        birthDate: DateTime.parse(json["data_nascimento"].toString()) == null
            ? null
            : DateTime.parse(json["data_nascimento"].toString()),
        genre: json["genre"] == null ? null : json["genre"],
        isDeleting: false);
  }
  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "cpf": cpf == null ? null : cpf,
        "nome_mae": motherName == null ? null : motherName,
        "data_nascimento":
            birthDate == null ? null : birthDate!.toIso8601String(),
        "genre": genre == null ? null : genre,
        "isDeleting": isDeleting,
      };

  static List<Register> fromJsonList(List list) {
    print(list);
    return list.map((item) {
      print(item);
      return Register.fromMap(item);
    }).toList();
  }
}
