part of 'bloc.dart';

abstract class DishesViewEvent {}

class LoadDishesEvent extends DishesViewEvent {}

class InitDishesEvent extends DishesViewEvent {}

class LoadDishesByTypeEvent extends DishesViewEvent {
  final String type;
  final int selectedType;

  LoadDishesByTypeEvent({
    required this.type,
    required this.selectedType,
  });
}

class CheckInternetDishesEvent extends DishesViewEvent {}

class NavigateToDetailsEvent extends DishesViewEvent {
  final DishModel model;
  final BuildContext context;

  NavigateToDetailsEvent({
    required this.model,
    required this.context,
  });
}
