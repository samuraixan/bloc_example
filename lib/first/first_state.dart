part of 'first_bloc.dart';

@immutable
abstract class FirstState {}

class FirstInitialState extends FirstState {}

class FirstLoadedState extends FirstState {
  final List<ItemUser> items;

  FirstLoadedState(this.items);
}