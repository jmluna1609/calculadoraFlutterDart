part of 'calculator_bloc.dart';

//son los eventos que mi bloc va aesperar

//esto me ayuda para que bloc sepa que va a recibir
@immutable
abstract class CalculatorEvent {}

class ResetAC extends CalculatorEvent{ }

//tengo que saber el numero o punto que esta presionando
class AddNumber extends CalculatorEvent{
  final String number;
 //permite enviar informacion
  AddNumber(this.number);
}

//cambia signo de negativo a positivo
class ChangeNegativePositive extends CalculatorEvent{}
//borra un numero
class DeleteLastEntry extends CalculatorEvent{}
//operacion a realizar
class OperationEntry extends CalculatorEvent{
  final String oparation;
  OperationEntry(this.oparation);
}
//es el signo = que calcula el resultado
class CalculateResult extends CalculatorEvent{

}