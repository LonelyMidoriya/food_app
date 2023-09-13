part of 'bloc.dart';

abstract class CartViewEvent {}

class AddToCartEvent implements CartViewEvent {
  final DishModel dishModel;
  final int count;

  const AddToCartEvent({
    required this.dishModel,
    required this.count,
  });
}

class SetInternetCartEvent implements CartViewEvent {
  final bool hasInternet;

  const SetInternetCartEvent({
    required this.hasInternet,
  });
}

class ClearCartEvent implements CartViewEvent {}

class DeleteFromCartEvent implements CartViewEvent {
  final DishModel dishModel;
  final int count;

  const DeleteFromCartEvent({
    required this.dishModel,
    required this.count,
  });
}

class InitCartEvent implements CartViewEvent {}
