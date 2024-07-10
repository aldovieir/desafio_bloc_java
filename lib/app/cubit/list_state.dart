part of 'list_cubit.dart';

enum ListStatus { loading, success, failure }

// ignore: must_be_immutable
class ListState {
  ListState._(
      {this.status = ListStatus.loading, this.itens, this.mock = false});

  ListState.loading() : this._(itens: []);

  ListState.success(List<Register> itens, bool mock)
      : this._(status: ListStatus.success, itens: itens, mock: mock);

  ListState.failure() : this._(itens: [], status: ListStatus.failure);

  ListStatus status;
  List<Register>? itens;
   String? cpf;
  DateTime? birthDate;
  String? genre;
  String? motherName;
  int? selected;
  bool mock = false;

  List<String> genreList = [
    'Masculino',
    'Feminino',
    'Outros',
  ];
}
