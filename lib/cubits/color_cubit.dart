import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ColorCubit extends Cubit<Color> {
  ColorCubit() : super(Colors.red);

  void nextColor() {
    if (state == Colors.red) {
      emit(Colors.green);
    } else if (state == Colors.green) {
      emit(Colors.blue);
    } else if (state == Colors.blue) {
      emit(Colors.black);
    } else if (state == Colors.black) {
      emit(Colors.red);
    }
  }
}
