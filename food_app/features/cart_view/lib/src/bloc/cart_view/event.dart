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

class CheckInternetEvent extends CartViewEvent {}

class DeleteFromCartEvent extends CartViewEvent {
  final DishModel dishModel;
  final int count;

  DeleteFromCartEvent({
    required this.dishModel,
    required this.count,
  });
}

class InitCartEvent extends CartViewEvent {}
