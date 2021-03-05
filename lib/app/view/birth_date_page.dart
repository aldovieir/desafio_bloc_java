import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_holo_date_picker/flutter_holo_date_picker.dart';

import '../app_import.dart';
//PAGINA DE INCLUSÃO DE DATA DE NASCIMENTO
class BirthDatepage extends StatefulWidget {
  @override
  _BirthDatepageState createState() => _BirthDatepageState();
}

class _BirthDatepageState extends State<BirthDatepage> {
  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: _height * 0.23),
        child: Column(
          children: <Widget>[
            Text(
              'Qual é a sua Data de nascimento?',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: EdgeInsets.only(top: _height * 0.22),
              child: Text(
                state.birthDate == null
                    ? ''
                    : DateTime.now().year - state.birthDate.year <= 18
                        ? 'Necessário ser maior de idade'
                        : DateFormat('dd-MM-yyyy ')
                            .format(state.birthDate)
                            .toString(),
                style: TextStyle(color: Colors.white, fontSize: 21),
              ),
            ),
            SizedBox(height: 20),
            RaisedButton(
              hoverColor: Colors.red,
              hoverElevation: 0,
              highlightColor: Colors.white,
              highlightElevation: 0,
              elevation: 0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40)),
              onPressed: () async {
                var datePicked = await DatePicker.showSimpleDatePicker(
                  context,
                  titleText: 'Selecione a data do seu nascimento !!!',
                  textColor: Colors.blueAccent,
                  initialDate: state.birthDate == null
                      ? DateTime.now()
                      : state.birthDate,
                  firstDate: DateTime(1960),
                  dateFormat: "dd-MMMM-yyyy",
                  locale: DateTimePickerLocale.pt_br,
                  looping: true,
                );
                setState(() {
                  state.birthDate = datePicked;
                });
              },
              child: Text(
                'Selecionar data',
                style: TextStyle(
                  color: Colors.blueAccent,
                ),
              ),
            )
          ],
        ),
      );
    });
  }
}
