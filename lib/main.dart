import 'package:bloc_comm_ex/blocs/color_bloc.dart';
import 'package:bloc_comm_ex/blocs/counter_bloc.dart';
import 'package:bloc_comm_ex/cubits/color_cubit.dart';
import 'package:bloc_comm_ex/cubits/counter_cubit.dart';
import 'package:flutter/material.dart';
import 'package:bloc_comm_ex/bloc_comm_page.dart';
import 'package:bloc_comm_ex/cubit_comm_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorBloc>(
          create: (context) => ColorBloc(),
        ),
        BlocProvider<CounterBloc>(
          create: (context) => CounterBloc(
            colorBloc: BlocProvider.of<ColorBloc>(context),
          ),
        ),
        BlocProvider<ColorCubit>(
          create: (context) => ColorCubit(),
        ),
        BlocProvider<CounterCubit>(
          create: (context) => CounterCubit(
            colorCubit: BlocProvider.of<ColorCubit>(context),
          ),
        ),
      ],
      child: MaterialApp(
        title: 'Bloc2Bloc Comm',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bloc2Bloc Comm'),
      ),
      body: Center(
        child: IntrinsicWidth(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              RaisedButton(
                child: Text(
                  'Bloc Version',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return BlocCommPage();
                      },
                    ),
                  );
                },
              ),
              RaisedButton(
                child: Text(
                  'Cubit Version',
                  style: TextStyle(fontSize: 18.0),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return CubitCommPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
