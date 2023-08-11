part of 'bloc.dart';

abstract class DishesViewEvent {}

class LoadDishesEvent implements DishesViewEvent {}

class InitDishesEvent implements DishesViewEvent {}

class LoadDishesByTypeEvent implements DishesViewEvent {
  final String type;
  final int selectedType;

  const LoadDishesByTypeEvent({
    required this.type,
    required this.selectedType,
  });
}

class SetInternetDishesEvent implements DishesViewEvent {
  final bool hasInternet;

  const SetInternetDishesEvent({
    required this.hasInternet,
  });
}

class NavigateToDetailsEvent implements DishesViewEvent {
  final DishModel model;
  final BuildContext context;

  const NavigateToDetailsEvent({
    required this.model,
    required this.context,
  });
}
