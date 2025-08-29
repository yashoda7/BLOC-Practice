import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'bloc_event.dart';
part 'bloc_state.dart';

class BlocBloc extends Bloc<BlocEvent, BlocState> {
  BlocBloc() : super(BlocInitial()) {
    on<CounterIncrementEvent>(counterIncrementEvent);
  on<CounterSnackbarActionEvent>(counterSnackbarActionEvent);
  on<CounterIncreamentActionEvent>(counterIncreamentActionEvent);
  }
  int value=0;

  FutureOr<void> counterIncrementEvent(CounterIncrementEvent event, Emitter<BlocState> emit) {
    value=value+1;
    emit(CounterIncrementState(val: value));
  }
  FutureOr<void> counterSnackbarActionEvent(CounterSnackbarActionEvent event,Emitter<BlocState> emit){
    emit(CounterSnackbarActionState());
  }
  FutureOr<void>counterIncreamentActionEvent(CounterIncreamentActionEvent event,Emitter<BlocState> emit){
    emit(CounterIncrementActionState());
  }
}
