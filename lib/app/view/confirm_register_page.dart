import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:intl/intl.dart';
import 'package:teste_bloc/utils/animation_item.dart';
import 'package:teste_bloc/widgets/logo_widget.dart';
import '../app_import.dart';


// PAGINA DE CONFIRMAÇÃO DE DADOS COM O BOTÃO DE TERMINAR 
// O REGISTO O QUE SALVA DE ACORDO COM O REPOSITÓRO SELECIONADO
class ConfirmRegisterPage extends StatefulWidget {
  final PageController pageController;

  const ConfirmRegisterPage({Key key, this.pageController}) : super(key: key);
  @override
  _ConfirmRegisterPageState createState() => _ConfirmRegisterPageState();
}

class _ConfirmRegisterPageState extends State<ConfirmRegisterPage> {
  List<AnimationRegister> animationlist = [];
  double _scaleHolder = 0;
  @override
  void initState() {
    super.initState();
    delayAnimatiom(
        AnimationRegister(
          name: 'padding_top_label',
          tween: Tween<double>(begin: 0.0, end: 1),
        ),
        Duration(milliseconds: 800), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
    delayAnimatiom(
        AnimationRegister(
          name: 'button_scale',
          tween: Tween<double>(begin: 0.0, end: 1),
        ),
        Duration(milliseconds: 1200), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
  }

  @override
  // ignore: must_call_super
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;

    double _width = MediaQuery.of(context).size.width;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return Padding(
        padding: EdgeInsets.only(left: 30, right: 30, top: _height * 0.23),
        child: Column(
          children: <Widget>[
            Text(
              'Confirme Seus Dados =D',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
              textAlign: TextAlign.left,
            ),
            Padding(
              padding: EdgeInsets.only(top: _height * 0.15),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Divider(),
                    Row(
                      children: [
                        TweenAnimationBuilder(
                            child: LogoWidget(),
                            duration: Duration(milliseconds: 1000),
                            curve: Curves.elasticOut,
                            tween: _scaleHolder == 0.0
                                ? findAnimation(
                                    'button_scale', 0.0, animationlist)
                                : Tween(begin: 5, end: 1.0),
                            builder: (context, value, child) {
                              return Transform.scale(
                                  scale: value,
                                  child: Text(
                                    'CPF: ',
                                    style: TextStyle(
                                        fontSize: _width / 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ));
                            }),
                        TweenAnimationBuilder(
                            child: LogoWidget(),
                            duration: Duration(milliseconds: 2000),
                            curve: Curves.elasticOut,
                            tween: _scaleHolder == 0.0
                                ? findAnimation(
                                    'button_scale', 0.0, animationlist)
                                : Tween(begin: 1, end: 1.0),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Text(
                                  state.cpf == 'CPF INVALIDO' ||
                                          state.cpf == '' ||
                                          state.cpf == null
                                      ? 'Campo obrigatório'
                                      : state.cpf,
                                  style: TextStyle(
                                      fontSize: _width / 22,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }),
                      ],
                    ),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TweenAnimationBuilder(
                              child: LogoWidget(),
                              duration: Duration(milliseconds: 3000),
                              curve: Curves.elasticOut,
                              tween: _scaleHolder == 0.0
                                  ? findAnimation(
                                      'button_scale', 0.0, animationlist)
                                  : Tween(begin: 1, end: 1.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                    scale: value,
                                    child: Text(
                                      'Data de Nascimento: ',
                                      style: TextStyle(
                                          fontSize: _width / 18,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                      textAlign: TextAlign.center,
                                    ));
                              }),
                          TweenAnimationBuilder(
                              child: LogoWidget(),
                              duration: Duration(milliseconds: 4000),
                              curve: Curves.elasticOut,
                              tween: _scaleHolder == 0.0
                                  ? findAnimation(
                                      'button_scale', 0.0, animationlist)
                                  : Tween(begin: 1, end: 1.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Text(
                                    state.birthDate == null
                                        ? 'Campo obrigatório'
                                        : DateTime.now().year -
                                                    state.birthDate.year <=
                                                18
                                            ? 'Necessário ser maior de idade'
                                            : DateFormat('dd-MM-yyyy ')
                                                .format(state.birthDate)
                                                .toString(),
                                    style: TextStyle(
                                        fontSize: _width / 22,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Divider(),
                    Row(
                      children: [
                        TweenAnimationBuilder(
                            child: LogoWidget(),
                            duration: Duration(milliseconds: 5000),
                            curve: Curves.elasticOut,
                            tween: _scaleHolder == 0.0
                                ? findAnimation(
                                    'button_scale', 0.0, animationlist)
                                : Tween(begin: 1, end: 1.0),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Text(
                                  'Genero: ',
                                  style: TextStyle(
                                      fontSize: _width / 18,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }),
                        TweenAnimationBuilder(
                            child: LogoWidget(),
                            duration: Duration(milliseconds: 6000),
                            curve: Curves.elasticOut,
                            tween: _scaleHolder == 0.0
                                ? findAnimation(
                                    'button_scale', 0.0, animationlist)
                                : Tween(begin: 1, end: 1.0),
                            builder: (context, value, child) {
                              return Transform.scale(
                                scale: value,
                                child: Text(
                                  state.genre == null
                                      ? 'Campo obrigatório'
                                      : state.genre,
                                  style: TextStyle(
                                      fontSize: _width / 22,
                                      color: Colors.white),
                                  textAlign: TextAlign.center,
                                ),
                              );
                            }),
                      ],
                    ),
                    Divider(),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          TweenAnimationBuilder(
                              child: LogoWidget(),
                              duration: Duration(milliseconds: 7000),
                              curve: Curves.elasticOut,
                              tween: _scaleHolder == 0.0
                                  ? findAnimation(
                                      'button_scale', 0.0, animationlist)
                                  : Tween(begin: 0.9, end: 1.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Text(
                                    'Nome da mãe: ',
                                    style: TextStyle(
                                        fontSize: _width / 18,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }),
                          TweenAnimationBuilder(
                              child: LogoWidget(),
                              duration: Duration(milliseconds: 8000),
                              curve: Curves.elasticOut,
                              tween: _scaleHolder == 0.0
                                  ? findAnimation(
                                      'button_scale', 0.0, animationlist)
                                  : Tween(begin: 1, end: 1.0),
                              builder: (context, value, child) {
                                return Transform.scale(
                                  scale: value,
                                  child: Text(
                                    state.motherName == 'Campo obrigatório' ||
                                            state.motherName == '' ||
                                            state.motherName == null ||
                                            state.motherName ==
                                                'Preencha Nome completo'
                                        ? 'Campo obrigatório'
                                        : state.motherName,
                                    style: TextStyle(
                                        fontSize: _width / 22,
                                        color: Colors.white),
                                    textAlign: TextAlign.center,
                                  ),
                                );
                              }),
                        ],
                      ),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _height * 0.15),
              child: Padding(
                padding: EdgeInsets.only(bottom: 20.0),
                child: TweenAnimationBuilder(
                  tween: Tween(begin: 0.0, end: 0.8),
                  duration: Duration(milliseconds: 9000),
                  curve: Curves.elasticOut,
                  builder: (context, value, child) {
                    return Transform.scale(
                      scale: value,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 80, vertical: 15),
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(40),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black38,
                                        offset: Offset(0, 10),
                                        blurRadius: 15),
                                  ],
                                ),
                                height: _height * 0.075,
                                child: RaisedButton(
                                  hoverColor: Colors.white,
                                  hoverElevation: 0,
                                  highlightColor: Colors.white,
                                  highlightElevation: 0,
                                  elevation: 0,
                                  color: Colors.white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(40)),
                                  child: Text(
                                    'TERMINEI',
                                    style: TextStyle(
                                      color: Colors.red,
                                    ),
                                  ),
                                  onPressed: () {
                                    if (state.cpf == null ||
                                        state.birthDate == null ||
                                        DateTime.now().year -
                                                state.birthDate.year <=
                                            18 ||
                                        state.genre == null ||
                                        state.motherName == null) {
                                      showDialog(
                                          context: context,
                                          builder: (_) {
                                            return Center(
                                                child: AlertDialog(
                                              title:
                                                  Text('Campos obrigatórios'),
                                              actions: [
                                                FlatButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);
                                                  },
                                                  child: Text('OK'),
                                                ),
                                              ],
                                            ));
                                          });
                                    } else {
                                      if (state.mock) {
                                        context.read<ListCubit>().addRegister();
                                        widget.pageController.animateToPage(0,
                                            duration:
                                                Duration(milliseconds: 1500),
                                            curve: Curves.easeInCubic);
                                      } else {
                                        context
                                            .read<ListCubit>()
                                            .addRegisterMock();
                                        widget.pageController.animateToPage(0,
                                            duration:
                                                Duration(milliseconds: 1500),
                                            curve: Curves.easeInCubic);
                                      }
                                    }
                                  },
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
