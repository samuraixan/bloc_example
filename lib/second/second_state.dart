part of 'second_bloc.dart';

@immutable
abstract class SecondState {}

class SecondInitial extends SecondState {}

class SecondLoadedState extends SecondState {
  final ItemPost item;

  SecondLoadedState(this.item);
}