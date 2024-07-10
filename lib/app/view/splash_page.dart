import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:teste_bloc/app/view/start_page.dart';
import 'package:teste_bloc/widgets/logo_widget.dart';

import '../app_import.dart';


// PRIMEIRA PAGINA CARREGA COM A LOGO DEPOIS NAVEGA PARA PAGINA COM A LISTA DE REGISTROS
class SplashPage extends StatefulWidget {
  final String title;
  const SplashPage({Key? key, this.title = "Splash"}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State {

  @override
  void initState() {
    super.initState();

    Future.delayed(
        const Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => StartPage())));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCubit, ListState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: Colors.grey[200],
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(
              child: Transform.scale(
                scale: 1.5,
                child: LogoWidget(),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            Center(
              child: CircularProgressIndicator(),
            )
          ],
        ),
      );
    });
  }
}
