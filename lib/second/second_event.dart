part of 'second_bloc.dart';

@immutable
abstract class SecondEvent {}

class InitialSecondEvent extends SecondEvent {}

class LoadSecondEvent extends SecondEvent {
  final int id;
  LoadSecondEvent(this.id);
}