import 'package:core/core.dart';
import 'package:domain/model/cart_item_model.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/get_cart_usecase.dart';
import 'package:domain/usecases/update_cart_usecase.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class CartViewBloc extends Bloc<CartViewEvent, CartViewState> {
  final GetCartUseCase _getCartUseCase;
  final UpdateCartUseCase _updateCartUseCase;

  CartViewBloc({
    required GetCartUseCase getCartUseCase,
    required UpdateCartUseCase updateCartUseCase,
  })  : _getCartUseCase = getCartUseCase,
        _updateCartUseCase = updateCartUseCase,
        super(
          CartViewState(
              cost: 0,
              cart: CartModel(cartItems: []),
              isLoaded: false,
              isError: false,
              errorMessage: ''),
        ) {
    on<InitCartEvent>(_init);
    on<AddToCartEvent>(_addToCart);
    on<DeleteFromCartEvent>(_deleteFromCart);
  }

  Future<void> _init(InitCartEvent event, Emitter<CartViewState> emit) async {
    emit(
      state.copyWith(isLoaded: false, isError: false),
    );
    try {
      final CartModel cartModel =
          await _getCartUseCase.execute(const NoParams());
      double cost = 0;
      for (var res in cartModel.cartItems) {
        cost += res.cost * res.count;
      }
      emit(state.copyWith(
        cost: cost,
        isLoaded: true,
        cart: cartModel,
      ));
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

  Future<void> _addToCart(
      AddToCartEvent event, Emitter<CartViewState> emit) async {
    try {
      if (state.cart.cartItems.isEmpty) {
        final CartItemModel cartItemModel = CartItemModel(
          name: event.dishModel.name,
          imageUrl: event.dishModel.imageUrl,
          cost: event.dishModel.cost,
          type: event.dishModel.type,
          description: event.dishModel.description,
          count: event.count,
        );
        final CartModel newCartModel = CartModel(cartItems: [cartItemModel]);
        _updateCartUseCase.execute(newCartModel);
        emit(
          state.copyWith(
            cost: cartItemModel.cost,
            cart: newCartModel,
            isLoaded: true,
            isError: false,
          ),
        );
      } else {
        if (state.cart.cartItems
            .where((element) => element.name == event.dishModel.name)
            .isNotEmpty) {
          final CartModel newCart;
          newCart = state.cart;
          newCart.cartItems
              .where((element) => element.name == event.dishModel.name)
              .first
              .count = event.count;
          _updateCartUseCase.execute(newCart);

          emit(
            state.copyWith(
              isLoaded: true,
              isError: false,
              cost: state.cost +
                  newCart.cartItems
                      .where((element) => element.name == event.dishModel.name)
                      .first
                      .cost,
              cart: newCart,
            ),
          );
        } else {
          final CartModel newCart;
          newCart = state.cart;
          final CartItemModel cartItemModel = CartItemModel(
            name: event.dishModel.name,
            imageUrl: event.dishModel.imageUrl,
            cost: event.dishModel.cost,
            type: event.dishModel.type,
            description: event.dishModel.description,
            count: event.count,
          );
          newCart.cartItems.add(cartItemModel);
          _updateCartUseCase.execute(newCart);
          emit(
            state.copyWith(
              isLoaded: true,
              isError: false,
              cost: state.cost + cartItemModel.cost,
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

  Future<void> _deleteFromCart(
      DeleteFromCartEvent event, Emitter<CartViewState> emit) async {
    try {
      if (event.count == 0) {
        final CartModel newCart;
        newCart = state.cart;
        newCart.cartItems
            .removeWhere((element) => element.name == event.dishModel.name);
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
        newCart.cartItems
            .where((element) => element.name == event.dishModel.name)
            .first
            .count = event.count;
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
