import 'package:flutter/material.dart';
import 'package:calculadora/widgets/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../calculator/calculator_bloc.dart';

class ResultGroup extends StatelessWidget {

  const ResultGroup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CalculatorBloc, CalculatorState>(
      builder: (context, state) {

        if(state.firstNumber =='0' && state.secondNumber == '0'){
         return MainResultLabel(text: state.mathResult.endsWith('.0')
             ? state.mathResult.substring(0,state.mathResult.length -2)
             : state.mathResult);
        }
        return Column(
          children: [
            SubResultLabel(text: state.firstNumber.endsWith('.0')
                ? state.firstNumber.substring(0,state.firstNumber.length -2)
                : state.firstNumber),
            SubResultLabel(text: state.operation),
            SubResultLabel(text: state.secondNumber.endsWith('.0')
                ? state.secondNumber.substring(0,state.secondNumber.length -2)
                : state.secondNumber),
            LineSeparator(),
            MainResultLabel(text: state.mathResult.endsWith('.0')
            ? state.mathResult.substring(0,state.mathResult.length -2)
            : state.mathResult)
          ],
        );
      },
    );
  }
}