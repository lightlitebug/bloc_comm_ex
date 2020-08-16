import 'dart:async';

import 'package:bloc_comm_ex/cubits/color_cubit.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<int> {
  final ColorCubit colorCubit;
  int incrementStep = 1;

  StreamSubscription counterCubitSubscription;

  CounterCubit({@required this.colorCubit})
      : assert(colorCubit != null),
        super(0) {
    counterCubitSubscription = colorCubit.listen((colorState) {
      if (colorState == Colors.red) {
        incrementStep = 1;
      } else if (colorState == Colors.green) {
        incrementStep = 10;
      } else if (colorState == Colors.blue) {
        incrementStep = 100;
      } else if (colorState == Colors.black) {
        emit(state - 100);
        incrementStep = -100;
      }
    });
  }

  @override
  Future<void> close() {
    counterCubitSubscription.cancel();
    return super.close();
  }

  void nextCounter() {
    emit(state + incrementStep);
  }
}
