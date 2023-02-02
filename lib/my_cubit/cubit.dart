import 'package:flutter_bloc/flutter_bloc.dart';
import 'states.dart';

class CounterCubit extends Cubit<CounterStates> {
  CounterCubit() : super(CounterIntialSate());

  static CounterCubit get(context) => BlocProvider.of(context);

  int counter = 0;

  void plusCounter() {
    counter++;
    emit(CounterPlusSate());
  }

  void minusCounter() {
    counter--;
    emit(CounterMinusSate());
  }
  
}
