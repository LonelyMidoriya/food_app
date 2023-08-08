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

class SetInternetOrdersEvent extends OrdersViewEvent {
  final bool hasInternet;

  SetInternetOrdersEvent({
    required this.hasInternet,
  });
}

class InitOrdersEvent extends OrdersViewEvent {}
