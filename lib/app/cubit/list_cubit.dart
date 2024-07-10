import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:pedantic/pedantic.dart';
import 'package:teste_bloc/app/models/register.dart';
import 'package:teste_bloc/shared/repository/repository.dart';
part 'list_state.dart';

// CLASSE QUE COMUNICA O ESTADOS DO APP AO REPOSITÓRIO
class ListCubit extends Cubit<ListState> {
  ListCubit({required this.repository}) : super(ListState.loading());

  final Repository repository;


// METODO USANDO PRA PUXAR E CRIAR A LISTA DE CADASTRO DENTRO DA PAGE
// VERIFICA QUAL REPOSITÓRIO ESTA SELECIONADO E PUXA A LISTA 

  Future<void> fetchList() async {
    if (state.mock) {
      emit(ListState.loading());
      try {
        final items = await repository.getRegisters();
        emit(ListState.success(items, true));
      } on Exception {
        emit(ListState.failure());
      }
    } else {
      emit(ListState.loading());
      try {
        final items = await repository.fetchRegisters();
        emit(ListState.success(items, false));
      } on Exception {
        emit(ListState.failure());
      }
    }
  }

// METODO QUE PEGA AS INFORMAÇÕES DA PAGINA E JOGA PRO REPOSITÓRIO E CRIAR O REGISTRO NA API
  Future<void> addRegister() async {
    Register item = Register(
      cpf: state.cpf,
      birthDate: state.birthDate!,
      genre: state.genre!,
      motherName: state.motherName!,
    );
    await repository.addRegister(item).then((list) {
      fetchList();
      emit(ListState.success(state.itens!, true));
    });
  }

// METODO QUE FILTRA E DELETA NA API O REGISTRO SELECIONADO
  Future<void> deleteRegisterApi(Register item) async {
    await repository.deleteRegisterApi(item);
    fetchList();
  }

// DELETA O REGISTRO MOCKADO
  Future<void> deleteRegister(String id) async {
    final deleteInProgress = state.itens!.map((item) {
      return item.id == id ? item.copyWith(isDeleting: true) : item;
    }).toList();

    emit(ListState.success(deleteInProgress, false));

    unawaited(repository.deleteRegister(id).then((_) {
      final deleteSuccess = List.of(state.itens!)
        ..removeWhere((element) => element.id == id);
      emit(ListState.success(deleteSuccess, false));
    }));
  }


// ADICONA O REGISTRO MOCKADO
  addRegisterMock() {
    state.itens!.add(Register(
      id: Random().nextInt(10).toString(),
      cpf: state.cpf,
      birthDate: state.birthDate!,
      genre: state.genre!,
      motherName: state.motherName!,
    ));

    emit(ListState.success(state.itens!, false));
  }
}
