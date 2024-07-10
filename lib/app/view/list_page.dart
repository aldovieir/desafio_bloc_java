import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/app/app_import.dart';
import 'package:intl/intl.dart';
import 'package:teste_bloc/utils/animation_item.dart';
import 'package:teste_bloc/widgets/logo_widget.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

//PAGINA QUE LISTA OS REGISTROS
// COM O BOTÃO DE SE CADASTRAR E O QUE TROCA O REPOSITÓRIO
class ListPage extends StatelessWidget {
  final PageController pageController;
  final Color buttonColor;

  const ListPage({
    Key? key,
    required this.pageController,
    required this.buttonColor,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(
      builder: (context, state) {
        switch (state.status) {
          case ListStatus.failure:
            return const Center(child: Text('Sem registros'));
          case ListStatus.success:
            return _ListView(
                items: state.itens!,
                pageController: pageController,
                buttonColor: buttonColor);
          default:
            return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}

// ignore: must_be_immutable
class _ListView extends StatefulWidget {
  bool selectedMock = false;
  _ListView(
      {Key? key,
      required this.items,
      required this.pageController,
      required this.buttonColor})
      : super(key: key);

  final List<Register> items;
  final PageController pageController;
  final Color buttonColor;
  @override
  __ListViewState createState() => __ListViewState();
}

class __ListViewState extends State<_ListView> {
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
          tween: Tween<double>(begin: 0.0, end: 0.9),
        ),
        Duration(milliseconds: 1200), (animation) {
      setState(() {
        animationlist.add(animation);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return SingleChildScrollView(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              TweenAnimationBuilder(
                  duration: Duration(milliseconds: 800),
                  curve: Curves.easeOutCubic,
                  tween: findAnimation('padding_top_label', 20, animationlist),
                  builder: (context, value, child) {
                    return Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30,
                              right: 30,
                              top: _height * 0.28 //+ value*//
                              ),
                          child: AnimatedOpacity(
                            opacity: value == 20 ? 0 : 1,
                            duration: Duration(milliseconds: 700),
                            child: Text(
                              'Lista de Registers',
                              style: TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        TweenAnimationBuilder(
                            duration: Duration(milliseconds: 1200),
                            curve: Curves.easeOutCubic,
                            tween: findAnimation(
                                'padding_top_label', 10, animationlist),
                            builder: (context, paddingvalue, child) {
                              return widget.items.isEmpty
                                  ? const Center(
                                      child: Text(
                                      'Nenhum cadastro registrado!',
                                      style: TextStyle(
                                          fontSize: 15,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                      textAlign: TextAlign.center,
                                    ))
                                  : Container(
                                      height: _height / 2.8,
                                      child: AnimationLimiter(
                                        child: ListView.builder(
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return AnimationConfiguration
                                                .staggeredList(
                                              position: index,
                                              duration: const Duration(
                                                  milliseconds: 700),
                                              child: SlideAnimation(
                                                verticalOffset: 50.0,
                                                child: FadeInAnimation(
                                                  child: RegisterTile(
                                                    item: widget.items[index],
                                                    onDeletePressed: (id) {
                                                      showDialog(
                                                          context: context,
                                                          builder: (_) {
                                                            return Center(
                                                                child:
                                                                    AlertDialog(
                                                              title: Text(
                                                                  'Deseja excluir esse cadastro ?'),
                                                              actions: [
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    if (state
                                                                        .mock) {
                                                                      context
                                                                          .read<
                                                                              ListCubit>()
                                                                          .deleteRegisterApi(
                                                                              widget.items[index]);
                                                                    } else {
                                                                      context
                                                                          .read<
                                                                              ListCubit>()
                                                                          .deleteRegister(
                                                                              id);
                                                                    }
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Ok'),
                                                                ),
                                                                ElevatedButton(
                                                                  onPressed:
                                                                      () {
                                                                    Navigator.pop(
                                                                        context);
                                                                  },
                                                                  child: Text(
                                                                      'Cancelar'),
                                                                ),
                                                              ],
                                                            ));
                                                          });
                                                    },
                                                  ),
                                                ),
                                              ),
                                            );
                                          },
                                          itemCount: widget.items.length,
                                        ),
                                      ),
                                    );
                            }),
                      ],
                    );
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Column(
                  children: <Widget>[
                    TweenAnimationBuilder(
                      child: LogoWidget(),
                      duration: Duration(milliseconds: 1000),
                      curve: Curves.elasticOut,
                      tween: _scaleHolder == 0.0
                          ? findAnimation('button_scale', 0.0, animationlist)
                          : Tween(begin: 0.9, end: 1.0),
                      builder: (context, value, child) {
                        return Transform.scale(
                          //TODO VERIFICAR
                          scale: value as double,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 40, vertical: 30),
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
                                    child: ElevatedButton(
                                      // onHighlightChanged: (press) {
                                      //   setState(() {
                                      //     if (press) {
                                      //       _scaleHolder = 0.1;
                                      //     } else {
                                      //       _scaleHolder = 0.0;
                                      //     }
                                      //   });
                                      // },
                                      // hoverColor: Colors.red,
                                      // hoverElevation: 0,
                                      // highlightColor: Colors.white,
                                      // highlightElevation: 0,
                                      // elevation: 0,
                                      // color: Colors.white,
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius:
                                      //         BorderRadius.circular(40)),
                                      onPressed: () {
                                        widget.pageController.animateToPage(1,
                                            duration:
                                                Duration(milliseconds: 800),
                                            curve: Curves.easeInCubic);
                                      },
                                      child: Text(
                                        'Vamos se Cadastrar ?',
                                        style: TextStyle(
                                            color: widget.buttonColor),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                    TweenAnimationBuilder(
                        child: LogoWidget(),
                        duration: Duration(milliseconds: 1000),
                        curve: Curves.elasticOut,
                        tween:
                            findAnimation('button_scale', 0.0, animationlist),
                        builder: (context, value, child) {
                          return Transform.scale(
                            //TODO VERIFICAR
                            scale: value as double,
                            child: ElevatedButton(
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return Center(
                                          child: AlertDialog(
                                        title: Text('Selecione repositório'),
                                        actions: [
                                          ElevatedButton(
                                            onPressed: () {
                                              state.mock = false;

                                              widget.selectedMock = false;
                                              context
                                                  .read<ListCubit>()
                                                  .fetchList();

                                              Navigator.pop(context);
                                            },
                                            child: Text('MOKC'),
                                          ),
                                          ElevatedButton(
                                            onPressed: () {
                                              state.mock = true;
                                              widget.selectedMock = true;
                                              context
                                                  .read<ListCubit>()
                                                  .fetchList();

                                              Navigator.pop(context);
                                              state.mock = true;
                                            },
                                            child: Text('Rest API'),
                                          ),
                                        ],
                                      ));
                                    });
                              },
                              child: Text(
                                'TROCAR REPOSITÓRIO',
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          );
                        }),
                  ],
                ),
              )
            ],
          ),
        ),
      );
    });
  }
}

class RegisterTile extends StatelessWidget {
  const RegisterTile({
    Key? key,
    required this.item,
    required this.onDeletePressed,
  }) : super(key: key);

  final Register item;
  final ValueSetter<String> onDeletePressed;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return ListTile(
        title: Column(
          children: [
            Row(
              children: [
                Text(
                  'Nome da Mãe : ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  item.motherName!,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'CPF : ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  item.cpf!,
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  'Data de Nascimento: ',
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                  textAlign: TextAlign.center,
                ),
                Text(
                  DateFormat('dd-MM-yyyy ').format(item.birthDate!).toString(),
                  style: TextStyle(fontSize: 12, color: Colors.black),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ],
        ),
        trailing: item.isDeleting
            ? const CircularProgressIndicator()
            : IconButton(
                icon: const Icon(Icons.delete, color: Colors.red),
                onPressed: () => onDeletePressed(item.id!),
              ),
      );
    });
  }
}
