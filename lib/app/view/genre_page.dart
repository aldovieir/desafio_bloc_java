import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/utils/consts.dart';
import 'package:teste_bloc/widgets/change_color.dart';

import '../app_import.dart';

class GenrePage extends StatefulWidget {
  @override
  _GenrePageState createState() => _GenrePageState();
}
// PAGINA DE INCLUSÃO DE GENERO
class _GenrePageState extends State<GenrePage> {
  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(top: _height * 0.23),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: _width * 0.23, right: 30),
              child: Text(
                'Qual é o seu Genero?',
                style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: _height / 5,
            ),
            Center(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  ChangeColor(
                    selected: state.selected,
                    genre: state.genreList[0],
                    onTap: () {
                      setState(() {
                        state.selected = 0;
                        state.genre = state.genreList[0];
                      });
                    },
                    index: 0,
                    linearGradient: listColors[4],
                  ),
                  ChangeColor(
                    selected: state.selected,
                    genre: state.genreList[1],
                    index: 1,
                    linearGradient: listColors[1],
                    onTap: () {
                      setState(() {
                        state.selected = 1;
                        state.genre = state.genreList[1];
                      });
                    },
                  ),
                  ChangeColor(
                    selected: state.selected,
                    genre: state.genreList[2],
                    index: 2,
                    linearGradient: listColors[2],
                    onTap: () {
                      setState(() {
                        state.selected = 2;
                        state.genre = state.genreList[2];
                      });
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}
