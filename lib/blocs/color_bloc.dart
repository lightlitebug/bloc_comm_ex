// events
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class ColorEvent {}

class ColorChanged extends ColorEvent {}

class ColorBloc extends Bloc<ColorEvent, Color> {
  ColorBloc() : super(Colors.red);

  @override
  Stream<Color> mapEventToState(ColorEvent event) async* {
    if (event is ColorChanged) {
      if (state == Colors.red) {
        yield Colors.green;
      } else if (state == Colors.green) {
        yield Colors.blue;
      } else if (state == Colors.blue) {
        yield Colors.black;
      } else if (state == Colors.black) {
        yield Colors.red;
      }
    }
  }
}
