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

class NavigateToDetailsEvent extends DishesViewEvent {
  final DishModel model;
  final BuildContext context;

  NavigateToDetailsEvent({
    required this.model,
    required this.context,
  });
}
