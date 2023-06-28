part of 'bloc.dart';

abstract class DishesViewEvent {}

class LoadEvent extends DishesViewEvent {}

class InitEvent extends DishesViewEvent {}

class LoadByTypeEvent extends DishesViewEvent {
  final String type;

  LoadByTypeEvent({
    required this.type,
  });
}
