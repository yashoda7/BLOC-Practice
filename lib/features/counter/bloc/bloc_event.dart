part of 'bloc_bloc.dart';

@immutable
sealed class BlocEvent {}
// event creation for a particular action in the UI
  //1-incrementing a number
class CounterIncrementEvent extends BlocEvent{
  
}
class CounterSnackbarActionEvent extends BlocEvent{}
class CounterIncreamentActionEvent extends BlocEvent{}