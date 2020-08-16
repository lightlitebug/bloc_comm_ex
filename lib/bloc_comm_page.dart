import 'package:bloc_comm_ex/blocs/color_bloc.dart';
import 'package:bloc_comm_ex/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BlocCommPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final colorBloc = BlocProvider.of<ColorBloc>(context);
    final counterBloc = BlocProvider.of<CounterBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc2Bloc Comm'),
      ),
      body: BlocBuilder<ColorBloc, Color>(
        builder: (context, colorState) {
          return Container(
            color: colorState,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BlocBuilder<CounterBloc, int>(
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
                          colorBloc.add(ColorChanged());
                        },
                      ),
                      SizedBox(width: 10.0),
                      RaisedButton(
                        child: Text(
                          'Next Number',
                          style: TextStyle(fontSize: 18.0),
                        ),
                        onPressed: () {
                          counterBloc.add(IncrementCounter());
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
