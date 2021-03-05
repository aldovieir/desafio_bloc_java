import 'package:flutter/material.dart';
import 'package:teste_bloc/utils/consts.dart';


// WIDGET DO LOGO
class LogoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          gradient: listColors[0],
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 8),
              blurRadius: 15,
            )
          ],
        ),
        child: Image.asset(
          'assets/bloc_logo_full.png',
          fit: BoxFit.contain,
        ));
  }
}
