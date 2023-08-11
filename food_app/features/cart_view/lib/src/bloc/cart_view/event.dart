part of 'bloc.dart';

abstract class CartViewEvent {}

class AddToCartEvent extends CartViewEvent {
  final DishModel dishModel;
  final int count;

  AddToCartEvent({
    required this.dishModel,
    required this.count,
  });
}

class SetInternetCartEvent extends CartViewEvent {
  final bool hasInternet;

  SetInternetCartEvent({
    required this.hasInternet,
  });
}

class ClearCartEvent extends CartViewEvent {}

class DeleteFromCartEvent extends CartViewEvent {
  final DishModel dishModel;
  final int count;

  DeleteFromCartEvent({
    required this.dishModel,
    required this.count,
  });
}

class InitCartEvent extends CartViewEvent {}
