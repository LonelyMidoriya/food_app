part of 'bloc.dart';

abstract class DishesViewEvent {}

class LoadDishesEvent implements DishesViewEvent {}

class InitDishesEvent implements DishesViewEvent {}

class LoadDishesByTypeEvent implements DishesViewEvent {
  final int selectedType;

  const LoadDishesByTypeEvent({
    required this.selectedType,
  });
}

class SetInternetDishesEvent implements DishesViewEvent {
  final bool hasInternet;

  const SetInternetDishesEvent({
    required this.hasInternet,
  });
}

class AddDishEvent implements DishesViewEvent {
  final DishModel dish;

  const AddDishEvent({
    required this.dish,
  });
}

class DeleteDishEvent implements DishesViewEvent {
  final DishModel dish;

  const DeleteDishEvent({
    required this.dish,
  });
}

class UpdateDishEvent implements DishesViewEvent {
  final DishModel dish;
  final DishModel newDish;

  const UpdateDishEvent({
    required this.dish,
    required this.newDish,
  });
}
