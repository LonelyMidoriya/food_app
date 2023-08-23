part of 'bloc.dart';

abstract class OrdersViewEvent {}

class AddToOrdersEvent implements OrdersViewEvent {
  final CartModel cartModel;
  final double cost;
  final String email;

  const AddToOrdersEvent({
    required this.cartModel,
    required this.cost,
    required this.email,
  });
}

class SetInternetOrdersEvent implements OrdersViewEvent {
  final bool hasInternet;

  const SetInternetOrdersEvent({
    required this.hasInternet,
  });
}

class InitOrdersEvent implements OrdersViewEvent {}

class InitAdminOrdersEvent implements OrdersViewEvent {}

class InitAdminSearchedOrdersEvent implements OrdersViewEvent {
  final String searchQuery;

  const InitAdminSearchedOrdersEvent({
    required this.searchQuery,
  });
}
