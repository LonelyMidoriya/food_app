import 'package:core/core.dart';
import 'package:domain/domain.dart';
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
          CartViewState.empty(),
        ) {
    on<InitCartEvent>(_init);
    on<AddToCartEvent>(_addToCart);
    on<DeleteFromCartEvent>(_deleteFromCart);
    on<CheckInternetEvent>(_checkInternet);
  }

  Future<void> _checkInternet(
    CheckInternetEvent event,
    Emitter<CartViewState> emit,
  ) async {
    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;
    emit(
      state.copyWith(hasInternet: hasInternet),
    );
  }

  Future<void> _init(InitCartEvent event, Emitter<CartViewState> emit) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        hasInternet: true,
        cart: CartModel(cartItems: []),
        cost: 0,
        errorMessage: '',
      ),
    );

    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;
    emit(
      state.copyWith(
        hasInternet: hasInternet,
      ),
    );

    if (state.hasInternet) {
      try {
        final CartModel cartModel =
            await _getCartUseCase.execute(const NoParams());
        double cost = 0;
        if (cartModel.cartItems.isNotEmpty) {
          for (CartItemModel cartItem in cartModel.cartItems) {
            cost += cartItem.cost * cartItem.count;
          }
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
  }

  Future<void> _addToCart(
    AddToCartEvent event,
    Emitter<CartViewState> emit,
  ) async {
    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;
    emit(
      state.copyWith(
        hasInternet: hasInternet,
      ),
    );

    if (state.hasInternet) {
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
            final int index = newCart.cartItems
                .indexWhere((element) => element.name == event.dishModel.name);
            newCart.cartItems[index] = newCart.cartItems
                .singleWhere((element) => element.name == event.dishModel.name)
                .copyWith(count: event.count);

            _updateCartUseCase.execute(newCart);

            emit(
              state.copyWith(
                isLoaded: true,
                isError: false,
                cost: state.cost +
                    newCart.cartItems
                        .singleWhere(
                          (element) => element.name == event.dishModel.name,
                        )
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
  }

  Future<void> _deleteFromCart(
    DeleteFromCartEvent event,
    Emitter<CartViewState> emit,
  ) async {
    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;
    emit(
      state.copyWith(
        hasInternet: hasInternet,
      ),
    );

    if (state.hasInternet) {
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
          final int index = newCart.cartItems
              .indexWhere((element) => element.name == event.dishModel.name);
          newCart.cartItems[index] = newCart.cartItems
              .singleWhere((element) => element.name == event.dishModel.name)
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
