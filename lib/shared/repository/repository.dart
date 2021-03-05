import 'dart:async';
import 'package:dio/dio.dart';

import 'package:teste_bloc/app/models/register.dart';
import 'package:teste_bloc/shared/mock_list.dart';

// REPOSITÓRIO COMUNICA O APP COM A API
class Repository {
  final Dio dio = Dio();
  var urlMock = 'https://603c2f43f4333a0017b673f2.mockapi.io/TestBloc';
  var id;

//Metodo utilizado para registrar o cadastro na API
  Future<Response<dynamic>> addRegister(Register item) {
    return dio.post(urlMock, data: item.toJson());
  }

//Metodo utilizado para puxar os cadastros da API
  Future<List<Register>> getRegisters() async {
    return await dio.get(urlMock).then((itens) async {
      print(itens);

      return Register.fromJsonList(itens.data);
    });
  }

//Metodo utilizado para dar um deley ao puxar registros mockados
  Future<List<Register>> fetchRegisters() async {
    await Future<void>.delayed(Duration(seconds: 1));
    return List.of(_generateRegistersList());
  }

//Metodo utilizado para puxar registros mockados
  List<Register> _generateRegistersList() {
    return MockList().getList();
  }

//Metodo utilizado para deletar o cadastro na API
  Future<dynamic> deleteRegisterApi(Register item) async {
    return await dio.delete('$urlMock/${item.id}');
  }

//Metodo utilizado para deletar o cadastro mockado
  Future<void> deleteRegister(String id) async {
    await Future<void>.delayed(Duration(seconds: 1));
  }
}
