part of 'bloc.dart';

abstract class OrdersViewEvent {}

class AddToOrdersEvent implements OrdersViewEvent {
  final CartModel cartModel;
  final double cost;

  const AddToOrdersEvent({
    required this.cartModel,
    required this.cost,
  });
}

class SetInternetOrdersEvent implements OrdersViewEvent {
  final bool hasInternet;

  const SetInternetOrdersEvent({
    required this.hasInternet,
  });
}

class InitOrdersEvent implements OrdersViewEvent {}
