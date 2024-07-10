import 'package:flutter/material.dart';

class ChangeColor extends StatelessWidget {
  final LinearGradient? linearGradient;

  final int? index;
  final double? offset;
  final VoidCallback? onTap;
  final String? genre;
  final int? selected;

  const ChangeColor(
      {Key? key,
      this.offset,
      this.index,
      this.onTap,
      this.linearGradient,
      this.genre,
      this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    //double _height = MediaQuery.of(context).size.height;
    return Stack(children: <Widget>[
      GestureDetector(
        onTap: onTap,
        child: Center(
          child: Container(
            child: Center(child: Text(genre!)),
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                border: Border.all(
                    width: 4,
                    color: (selected == index) ? Colors.black : Colors.white),
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                      color: Colors.black45,
                      offset: Offset(0, 10),
                      blurRadius: 10)
                ],
                gradient: linearGradient),
          ),
        ),
      ),
    ]);
  }
}
