part of 'bloc.dart';

class CartViewState {
  final double cost;
  final CartModel cart;
  final bool isLoaded;
  final bool isError;
  final Object errorMessage;
  final bool hasInternet;

  CartViewState({
    required this.cost,
    required this.cart,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
    required this.hasInternet,
  });

  CartViewState.empty()
      : cost = 0,
        cart = CartModel(cartItems: []),
        isLoaded = false,
        isError = false,
        errorMessage = '',
        hasInternet = true;

  CartViewState copyWith({
    double? cost,
    CartModel? cart,
    bool? isLoaded,
    bool? isError,
    Object? errorMessage,
    bool? hasInternet,
  }) =>
      CartViewState(
        cost: cost ?? this.cost,
        cart: cart ?? this.cart,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        hasInternet: hasInternet ?? this.hasInternet,
      );
}
