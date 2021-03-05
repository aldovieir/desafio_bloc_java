import 'package:teste_bloc/app/app_import.dart';

class MockList {
  List<Register> getList() {
    var a = Register(
        cpf: '852.654.753.55',
        birthDate: DateTime(1991, 12, 11),
        genre: 'Masculino',
        id: '1',
        motherName: 'Maria Antonieta',
        isDeleting: false);
    var b = Register(
        cpf: '123..510.521.77',
        birthDate: DateTime(1998, 7, 18),
        genre: 'Masculino',
        id: '2',
        motherName: 'Lucia Alvez',
        isDeleting: false);
    var c = Register(
        cpf: '123.312.554-88',
        birthDate: DateTime(1984, 1, 15),
        genre: 'Masculino',
        id: '3',
        motherName: 'Geovana Alburquerque',
        isDeleting: false);
    return [a, b, c];
  }
}
