// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'bloc_bloc.dart';

@immutable
sealed class BlocState {}

final class BlocInitial extends BlocState {}

class CounterIncrementState extends BlocState {
  int val;
   CounterIncrementState({
    required this.val,
  });

}
