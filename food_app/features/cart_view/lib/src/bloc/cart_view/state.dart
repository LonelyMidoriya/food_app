part of 'bloc.dart';

class CartViewState {
  double cost;
  List<DishModel> dishes;
  Map<String, dynamic> cart;
  bool isLoaded;
  bool isError;
  Object errorMessage;

  CartViewState({
    required this.cost,
    required this.cart,
    required this.dishes,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
  });

  CartViewState copyWith({
    double? cost,
    List<DishModel>? dishes,
    Map<String, dynamic>? cart,
    bool? isLoaded,
    bool? isError,
    bool? isInit,
    Object? errorMessage,
  }) =>
      CartViewState(
        cost: cost ?? this.cost,
        cart: cart ?? this.cart,
        dishes: dishes ?? this.dishes,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
