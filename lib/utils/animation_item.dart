import 'package:flutter/material.dart';

typedef AnimationCallBack = void Function(AnimationRegister animation);

// CLASSE DE ANIMAÇÕES
class AnimationRegister {
  final String name;
  final Tween<double> tween;

  AnimationRegister({this.name, this.tween});
}
// METODO DE ANIMAÇÃO DE POSIÇÃO DOS WIDGETS
 Tween findAnimation(
    String name, double initialValue, List<AnimationRegister> list) {
  try {
    if (list.length > 0) {
      var tween = list.where((element) => element.name == name);
      return tween == null
          ? Tween<double>(begin: initialValue, end: initialValue)
          : tween.first.tween;
    } else {
      return Tween<double>(begin: initialValue, end: initialValue);
    }
  } catch (e) {
    return Tween<double>(begin: initialValue, end: initialValue);
  }
} 

//METODO DE ANIMAÇÃO DE DEFINIÇÃO DO TEMPO DE ANIMAÇÃO
Future<void> delayAnimatiom(AnimationRegister animation, Duration duration,
    AnimationCallBack function) async {
  await Future.delayed(duration, () {});
  function(animation);
}
