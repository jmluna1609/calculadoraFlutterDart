import 'package:calculadora/calculator/calculator_bloc.dart';
import 'package:calculadora/screens/calculator_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

 
void main() => runApp(AppState());
//para que se mantenga ordenado creamos appState
class AppState extends StatelessWidget {
  const AppState({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider<CalculatorBloc>(create: (_)=> CalculatorBloc() )
    ],
        child: MyApp()

    );
  }
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      home: CalculatorScreen(),
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.blue
      ),
    );
  }
}