part of 'bloc.dart';

class OrdersViewState {
  final OrdersModel orders;
  final bool isLoaded;
  final bool isError;
  final Object errorMessage;
  final bool hasInternet;

  OrdersViewState({
    required this.orders,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
    required this.hasInternet,
  });

  OrdersViewState.empty()
      : orders = OrdersModel(
          carts: [],
        ),
        isLoaded = false,
        isError = false,
        errorMessage = '',
        hasInternet = true;

  OrdersViewState copyWith({
    OrdersModel? orders,
    bool? isLoaded,
    bool? isError,
    Object? errorMessage,
    bool? hasInternet,
  }) =>
      OrdersViewState(
        orders: orders ?? this.orders,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        hasInternet: hasInternet ?? this.hasInternet,
      );
}
