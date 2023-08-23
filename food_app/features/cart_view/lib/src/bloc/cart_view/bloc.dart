import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class CartViewBloc extends Bloc<CartViewEvent, CartViewState> {
  final GetCartUseCase _getCartUseCase;
  final UpdateCartUseCase _updateCartUseCase;
  final InternetConnection _internetConnection;

  CartViewBloc({
    required GetCartUseCase getCartUseCase,
    required UpdateCartUseCase updateCartUseCase,
    required InternetConnection internetConnection,
  })  : _getCartUseCase = getCartUseCase,
        _updateCartUseCase = updateCartUseCase,
        _internetConnection = internetConnection,
        super(
          CartViewState.empty(),
        ) {
    on<InitCartEvent>(_init);
    on<AddToCartEvent>(_addToCart);
    on<DeleteFromCartEvent>(_deleteFromCart);
    on<SetInternetCartEvent>(_setInternet);
    on<ClearCartEvent>(_clearCart);
    final StreamSubscription<InternetStatus> listener =
        _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          add(const SetInternetCartEvent(hasInternet: true));
          add(InitCartEvent());
        } else {
          add(const SetInternetCartEvent(hasInternet: false));
        }
      },
    );
  }

  Future<void> _setInternet(
    SetInternetCartEvent event,
    Emitter<CartViewState> emit,
  ) async {
    emit(
      state.copyWith(hasInternet: event.hasInternet),
    );
  }

  Future<void> _clearCart(
    ClearCartEvent event,
    Emitter<CartViewState> emit,
  ) async {
    try {
      final CartModel newCartModel = CartModel.empty();
      _updateCartUseCase.execute(newCartModel);
      emit(
        state.copyWith(
          isLoaded: true,
          isError: false,
          cart: newCartModel,
          cost: 0,
          errorMessage: '',
        ),
      );
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          isLoaded: false,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _init(InitCartEvent event, Emitter<CartViewState> emit) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        cart: CartModel.empty(),
        cost: 0,
        errorMessage: '',
      ),
    );

    if (state.hasInternet) {
      try {
        final CartModel cartModel =
            await _getCartUseCase.execute(const NoParams());
        double cost = 0;
        if (cartModel.cartItems.isNotEmpty) {
          for (CartItemModel cartItem in cartModel.cartItems) {
            cost += cartItem.dish.cost * cartItem.count;
          }
        }
        emit(
          state.copyWith(
            cost: cost,
            isLoaded: true,
            cart: cartModel,
          ),
        );
      } catch (e, _) {
        emit(
          state.copyWith(
            isError: true,
            isLoaded: false,
            errorMessage: e,
          ),
        );
      }
    }
  }

  Future<void> _addToCart(
    AddToCartEvent event,
    Emitter<CartViewState> emit,
  ) async {
    if (state.hasInternet) {
      try {
        if (state.cart.cartItems.isEmpty) {
          final CartItemModel cartItemModel = CartItemModel(
            dish: event.dishModel,
            count: event.count,
          );
          final CartModel newCartModel = CartModel(
            cartItems: [cartItemModel],
            cost: 0,
            date: '',
            id: 0,
          );
          _updateCartUseCase.execute(newCartModel);
          emit(
            state.copyWith(
              cost: cartItemModel.dish.cost,
              cart: newCartModel,
              isLoaded: true,
              isError: false,
            ),
          );
        } else {
          if (state.cart.cartItems
              .where((element) => element.dish.name == event.dishModel.name)
              .isNotEmpty) {
            final CartModel newCart;
            newCart = state.cart;
            final int index = newCart.cartItems
                .indexWhere((element) => element.dish.name == event.dishModel.name);
            newCart.cartItems[index] = newCart.cartItems
                .singleWhere((element) => element.dish.name == event.dishModel.name)
                .copyWith(count: event.count);

            _updateCartUseCase.execute(newCart);

            emit(
              state.copyWith(
                isLoaded: true,
                isError: false,
                cost: state.cost +
                    newCart.cartItems
                        .singleWhere(
                          (element) => element.dish.name == event.dishModel.name,
                        )
                        .dish.cost,
                cart: newCart,
              ),
            );
          } else {
            final CartModel newCart;
            newCart = state.cart;
            final CartItemModel cartItemModel = CartItemModel(
              dish: event.dishModel,
              count: event.count,
            );
            newCart.cartItems.add(cartItemModel);
            _updateCartUseCase.execute(newCart);
            emit(
              state.copyWith(
                isLoaded: true,
                isError: false,
                cost: state.cost + cartItemModel.dish.cost,
                cart: newCart,
              ),
            );
          }
        }
      } catch (e, _) {
        emit(
          state.copyWith(
            isError: true,
            isLoaded: false,
            errorMessage: e,
          ),
        );
      }
    }
  }

  Future<void> _deleteFromCart(
    DeleteFromCartEvent event,
    Emitter<CartViewState> emit,
  ) async {
    if (state.hasInternet) {
      try {
        if (event.count == 0) {
          final CartModel newCart;
          newCart = state.cart;
          newCart.cartItems
              .removeWhere((element) => element.dish.name == event.dishModel.name);
          _updateCartUseCase.execute(newCart);
          emit(
            state.copyWith(
              isLoaded: true,
              isError: false,
              cost: state.cost - event.dishModel.cost,
              cart: newCart,
            ),
          );
        } else {
          final CartModel newCart;
          newCart = state.cart;
          final int index = newCart.cartItems
              .indexWhere((element) => element.dish.name == event.dishModel.name);
          newCart.cartItems[index] = newCart.cartItems
              .singleWhere((element) => element.dish.name == event.dishModel.name)
              .copyWith(count: event.count);
          _updateCartUseCase.execute(newCart);
          emit(
            state.copyWith(
              isLoaded: true,
              isError: false,
              cost: state.cost - event.dishModel.cost,
              cart: newCart,
            ),
          );
        }
      } catch (e, _) {
        emit(
          state.copyWith(
            isError: true,
            isLoaded: false,
            errorMessage: e,
          ),
        );
      }
    }
  }
}
