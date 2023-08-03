part of 'bloc.dart';

abstract class OrdersViewEvent {}

class AddToOrdersEvent extends OrdersViewEvent {
  final CartModel cartModel;
  final double cost;

  AddToOrdersEvent({
    required this.cartModel,
    required this.cost,
  });
}

class CheckInternetOrdersEvent extends OrdersViewEvent {}

class InitOrdersEvent extends OrdersViewEvent {}
