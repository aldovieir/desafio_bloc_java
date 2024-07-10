import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/utils/animation_item.dart';
import 'package:teste_bloc/utils/consts.dart';
import 'package:teste_bloc/widgets/logo_widget.dart';

import '../app_import.dart';

// ignore: must_be_immutable

// PAGINA BASE ONDE E FEITA TODA ANIMAÇÃO E A TRANSIÇÃO ENTRE TODAS AS PAGINAS
// ignore: must_be_immutable
class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  
 late  final PageController pageController;
  List<AnimationRegister> animationlist = [];
  late Tween<double> postionLogo;
  int _currentIndex = 0;
  int _currentIndexColor = 0;
  late Tween _animacaoColor;
  @override
  void initState() {
    super.initState();
    setState(() {
      delayAnimatiom(
          AnimationRegister(
            name: 'logo_scale',
            tween: Tween<double>(begin: 0.0, end: 0.8),
          ),
          Duration(milliseconds: 800), (animation) {
        setState(() {
          animationlist.add(animation);
        });
      });
      pageController = PageController(initialPage: 0);
      postionLogo = Tween(begin: 0.0, end: 0.0);
      _animacaoColor = Tween(begin: 2.3, end: 2.3);
    });
  }

  @override
  Widget build(BuildContext context) {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        body: Stack(
          alignment: Alignment.topCenter,
          children: <Widget>[
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 400),
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    gradient: listColors[_currentIndexColor]),
              ),
              builder: (BuildContext context, value, child) {
                return Transform.scale(scale: value as double, child: child);
              },
              tween: _animacaoColor,
            ),
            SizedBox(
              height: _height,
              width: _height,
              child: PageView(
                controller: pageController,
                onPageChanged: (index) {
                  setState(() {
                    _currentIndex = index;
                    switch (index) {
                      case 0:
                        postionLogo = Tween(begin: 0.0, end: 0.0);
                        break;
                      default:
                        postionLogo = Tween(begin: 0.0, end: 0.25);
                    }
                  });
                },
                scrollDirection: Axis.vertical,
                children: <Widget>[
                  ListPage(
                    pageController: pageController,
                    buttonColor: listColors[_currentIndexColor].colors[1],
                  ),
                  CpfPage(),
                  BirthDatepage(),
                  NomeMotherPage(),
                  GenrePage(),
                  ConfirmRegisterPage(
                    pageController: pageController,
                  )
                ],
              ),
            ),
            TweenAnimationBuilder(
              duration: Duration(milliseconds: 300),
              curve:
                  _currentIndex == null ? Curves.elasticOut : Curves.easeInOut,
              tween: postionLogo,
              builder: (BuildContext context, animation, child) {
                return AnimatedPositioned(
                  duration: Duration(milliseconds: 300),
                  top: _height * 0.10,
                  right: _currentIndex == 0 ? _width / 2 - (100 / 2) : 15,
                  child: TweenAnimationBuilder(
                    child: LogoWidget(),
                    duration: Duration(milliseconds: 300),
                    curve: Curves.elasticOut,
                    tween: findAnimation('logo_scale', 0.0, animationlist),
                    builder: (context, value, child) {
                      return Transform.scale(
                          scale: (value as double) - animation, child: child);
                    },
                  ),
                );
              },
            ),
            AnimatedPositioned(
              top: _height * 0.85,
              right: _currentIndex == 0 ? -40 : 10,
              width: 40,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              child: Column(
                children: <Widget>[
                  IconButton(
                    icon: Icon(
                      Icons.expand_less,
                      color: Colors.white54,
                    ),
                    onPressed: () {
                      pageController.animateToPage(_currentIndex - 1,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInCubic);
                    },
                  ),
                  SizedBox(
                    height: 0,
                  ),
                  IconButton(
                    icon: Icon(
                      Icons.expand_more,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      pageController.animateToPage(_currentIndex + 1,
                          duration: Duration(milliseconds: 800),
                          curve: Curves.easeInCubic);
                    },
                  ),
                ],
              ),
            ),
            AnimatedPositioned(
              top: _height * 0.15,
              left: _currentIndex == 0 ? -40 : 10,
              width: 40,
              duration: Duration(milliseconds: 400),
              curve: Curves.easeOutCubic,
              child: Column(
                children: <Widget>[
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color:
                            _currentIndex == 1 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: 68,
                    decoration: BoxDecoration(
                        color:
                            _currentIndex == 2 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color:
                            _currentIndex == 3 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color:
                            _currentIndex == 4 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    height: 8,
                    width: 8,
                    decoration: BoxDecoration(
                        color:
                            _currentIndex == 5 ? Colors.white : Colors.white54,
                        shape: BoxShape.circle),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
