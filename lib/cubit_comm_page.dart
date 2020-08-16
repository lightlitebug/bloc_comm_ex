import 'package:bloc_comm_ex/cubits/color_cubit.dart';
import 'package:bloc_comm_ex/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CubitCommPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorCubit = BlocProvider.of<ColorCubit>(context);
    final counterCubit = BlocProvider.of<CounterCubit>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Cubit2Cubit Comm'),
      ),
      body: BlocBuilder<ColorCubit, Color>(
        builder: (context, colorState) {
          return Container(
            color: colorState,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterCubit, int>(
                    builder: (context, counterState) {
                      return Text(
                        '$counterState',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 60,
                          fontWeight: FontWeight.bold,
                        ),
                      );
                    },
                  ),
                  SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      RaisedButton(
                        child: Text(
                          'Next Color',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          colorCubit.nextColor();
                        },
                      ),
                      SizedBox(width: 10.0),
                      RaisedButton(
                        child: Text(
                          'Next Number',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          counterCubit.nextCounter();
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
