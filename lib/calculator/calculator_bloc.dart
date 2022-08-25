import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:meta/meta.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {

  CalculatorBloc() : super(CalculatorState());

  /***
   * Cada vez que recibe un evento se dispara un event state
   */
  @override
  Stream <CalculatorState> mapEventToState (

      CalculatorEvent event/*calculator tipo event*/,
    ) async* {
    //borra todo.
    if(event is ResetAC){
      yield* /*el '*' permite indicar
      que retorne el valor que la funcionque estamos
      emitiendo es lo único que va a emitir*/ this._resetAC();

    //agrega numeros
    }
    else if(event is AddNumber){
      yield state.copywith( //enviamos lo que va a cambiar
        //if result es 0 ? entonces reemplazo el numero
        mathResult: (state.mathResult == '0')
            ? event.number
        //sino
            : state.mathResult + event.number,
        /* con esto: no se acumula: event.number,*/
      );

    }
    //cambia el signo
    else if(event is ChangeNegativePositive){
      //el resultado es el que va a cmbiar
      yield state.copywith(
        mathResult: state.mathResult.contains('-')
        ? state.mathResult.replaceFirst('-', '')
        : '-'+ state.mathResult
        );

    }
    //borrar ultimo numero
    else if( event is DeleteLastEntry){
      yield state.copywith(
        mathResult: state.mathResult.length>1
            ? state.mathResult.substring(0,state.mathResult.length - 1)
            : '0'
      );

    }
    //operacion
    else if(event is OperationEntry ){
    yield state.copywith(
      firstNumber: state.mathResult,
      mathResult: '0',
      operation: event.oparation,
      secondNumber: '0'
    );
    }
    //calcula resultado
    else if(event is CalculateResult){
      yield* _calculateResult();
    }

  }
//async* va junto con yield
Stream<CalculatorState> _resetAC() async* {
    yield CalculatorState(
        firstNumber: '0',
        mathResult:'0',
        secondNumber: '0',
        operation: '+'

    );
}

  /***
   *  desarrollamos nuestra lógica
   */
  Stream<CalculatorState> _calculateResult() async* {
    final double num1= double.parse(state.firstNumber);
    final double num2 = double.parse(state.mathResult);
    switch(state.operation){
      case '+':
        yield state.copywith(
          secondNumber: state.mathResult,
        mathResult: '${num1 + num2}' //$ para que convierta a string
      );
        break;

      case '-':
        yield state.copywith(
            secondNumber: state.mathResult,
            mathResult: '${num1 - num2}' //$ para que convierta a string
        );
        break;
      case '*':
        yield state.copywith(
            secondNumber: state.mathResult,
            mathResult: '${num1 * num2}' //$ para que convierta a string
        );
        break;
      case '/':
        yield state.copywith(
            secondNumber: state.mathResult,
            mathResult: '${num1 / num2}' //$ para que convierta a string
        );
        break;
      default:
        yield state;
    }

  /*
    yield CalculatorState(
        firstNumber: '0',
        mathResult:'0',
        secondNumber: '0',
        operation: '+'

    );*/
  }

}
