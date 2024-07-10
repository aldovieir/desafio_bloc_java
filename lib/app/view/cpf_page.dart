import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:brasil_fields/brasil_fields.dart';

import '../app_import.dart';

//PAGINA DE INCLUSÃO DE CPF
class CpfPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: _height * 0.23),
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Text(
                'Qual é o seu CPF ?',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.left,
              ),
              Padding(
                padding: EdgeInsets.only(top: _height * 0.22),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      TextFormField(
                        controller: TextEditingController(
                          text: state.cpf == 'CPF INVALIDO' ? '' : state.cpf,
                        ),
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CpfInputFormatter(),
                        ],
                        onChanged: (texto) {
                          CPFValidator();
                          if (CPFValidator.isValid(texto)) {
                            state.cpf = texto;
                          } else {
                            state.cpf = 'CPF INVALIDO';
                          }
                        },
                        cursorColor: Colors.white,
                        style: TextStyle(color: Colors.white, fontSize: 21),
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            labelStyle:
                                TextStyle(color: Colors.white, fontSize: 18),
                            //labelText: '',
                            hintText: "CPF",
                            hintStyle:
                                TextStyle(color: Colors.white54, fontSize: 18),
                            border: InputBorder.none),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Text(
                            state.cpf == 'CPF INVALIDO'
                                ? 'CPF INVALIDO'
                                : '111.111.111-11',
                            style:
                                TextStyle(fontSize: 14, color: Colors.white38),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}
