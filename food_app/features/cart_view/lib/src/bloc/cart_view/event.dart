part of 'bloc.dart';

abstract class CartViewEvent {}

class AddToCartEvent extends CartViewEvent {
  final int count;
  final String name;
  AddToCartEvent({
    required this.name,
    required this.count,
  });
}

class DeleteFromCartEvent extends CartViewEvent {
  final int count;
  final String name;
  DeleteFromCartEvent({
    required this.name,
    required this.count,
  });
}

class InitCartEvent extends CartViewEvent {}
