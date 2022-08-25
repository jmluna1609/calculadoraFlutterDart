part of 'calculator_bloc.dart';
//es una clase que vamos acumular informacion que no quiero que cambie
//una clase abstract no se puede inicializar

class CalculatorState {
  final String mathResult; //resultado
  final String firstNumber;
  final String secondNumber;
  final String operation;

  //creamos constructor
  CalculatorState({
      this.mathResult = '0',
    this.firstNumber = '0',
    this.secondNumber= '0',
    this.operation= '+'
  });

  //creamos el metodo que a regresar un nuevo estado
  CalculatorState copywith({
     String ? mathResult, //resultado
     String ? firstNumber,
     String ? secondNumber,
     String ? operation,
})=> CalculatorState (
    //si recibimos a math result va a ser igual a math result
    mathResult: mathResult ?? /*si viene null recibo el valor original*/
    this.mathResult,

    firstNumber:firstNumber ?? this.firstNumber,
    secondNumber:secondNumber ?? this.secondNumber,
    operation:operation ?? this.operation,
  );
}

