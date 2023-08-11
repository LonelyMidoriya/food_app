part of 'bloc.dart';

class OrdersViewState {
  final OrderHistoryModel orders;
  final bool isLoaded;
  final bool isError;
  final Object errorMessage;
  final bool hasInternet;

  const OrdersViewState({
    required this.orders,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
    required this.hasInternet,
  });

  const OrdersViewState.empty()
      : orders = const OrderHistoryModel(
          carts: [],
        ),
        isLoaded = false,
        isError = false,
        errorMessage = '',
        hasInternet = true;

  OrdersViewState copyWith({
    OrderHistoryModel? orders,
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
