import 'package:core/core.dart';
import 'package:domain/model/cart_model.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/get_cart_usecase.dart';
import 'package:domain/usecases/get_one_dish_usecase.dart';
import 'package:domain/usecases/update_cart_usecase.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class CartViewBloc extends Bloc<CartViewEvent, CartViewState> {
  final GetCartUseCase _getCartUseCase;
  final GetOneDishUseCase _getOneDishUseCase;
  final UpdateCartUseCase _updateCartUseCase;

  CartViewBloc({
    required GetCartUseCase getCartUseCase,
    required GetOneDishUseCase getOneDishUseCase,
    required UpdateCartUseCase updateCartUseCase,
  })  : _getCartUseCase = getCartUseCase,
        _getOneDishUseCase = getOneDishUseCase,
        _updateCartUseCase = updateCartUseCase,
        super(
          CartViewState(
            isLoaded: false,
            isError: false,
            dishes: [],
            cart: {},
            errorMessage: '',
            cost: 0,
          ),
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
      List<DishModel> dishes = [];

      for (String name in cartModel.dishes.keys) {
        DishModel dish = await _getOneDishUseCase.execute(name);
        dishes.add(dish);
      }
      double cost = 0;
      for (var res in dishes) {
        cost += res.cost * cartModel.dishes[res.name];
      }
      emit(state.copyWith(
        dishes: dishes,
        cost: cost,
        isLoaded: true,
        cart: cartModel.dishes,
      ));
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          isInit: false,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _addToCart(
      AddToCartEvent event, Emitter<CartViewState> emit) async {
    try {
      if (state.cart.isEmpty) {
        Map<String, dynamic> newMap = {};
        newMap.addAll({event.name: event.count});
        DishModel dish = await _getOneDishUseCase.execute(event.name);
        double cost = dish.cost;
        _updateCartUseCase.execute(newMap);
        emit(
          state.copyWith(
            cost: cost,
            cart: newMap,
            dishes: [dish],
            isLoaded: true,
          ),
        );
      } else {
        if (state.cart.containsKey(event.name)) {
          Map<String, dynamic> newCart = {};
          newCart.addAll(state.cart);
          DishModel dish = state.dishes[
              state.dishes.indexWhere((element) => element.name == event.name)];
          newCart[event.name] = event.count;
          _updateCartUseCase.execute(newCart);

          emit(
            state.copyWith(
              isLoaded: true,
              cost: state.cost + dish.cost,
              cart: newCart,
            ),
          );
        } else {
          Map<String, dynamic> newCart = {};
          newCart.addAll(state.cart);
          DishModel dish = await _getOneDishUseCase.execute(event.name);
          newCart.addAll(
            {dish.name: 1},
          );
          _updateCartUseCase.execute(newCart);
          emit(
            state.copyWith(
              isLoaded: true,
              cost: state.cost + dish.cost,
              cart: newCart,
              dishes: [...state.dishes, dish],
            ),
          );
        }
      }
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          isInit: false,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _deleteFromCart(
      DeleteFromCartEvent event, Emitter<CartViewState> emit) async {
    try {
      if (event.count == 0) {
        Map<String, dynamic> newCart = {};
        newCart.addAll(state.cart);
        DishModel dish = state.dishes[
            state.dishes.indexWhere((element) => element.name == event.name)];
        newCart[event.name] = event.count;
        newCart.removeWhere((key, value) => value == 0);
        _updateCartUseCase.execute(newCart);
        List<DishModel> dishes = [];
        dishes = [...state.dishes];
        dishes.removeWhere((element) => element == dish);
        emit(
          state.copyWith(
            isLoaded: true,
            cost: state.cost - dish.cost,
            cart: newCart,
            dishes: dishes,
          ),
        );
      } else {
        Map<String, dynamic> newCart = {};
        newCart.addAll(state.cart);
        DishModel dish = await _getOneDishUseCase.execute(event.name);
        newCart.update(dish.name, (value) => event.count);
        _updateCartUseCase.execute(newCart);
        emit(
          state.copyWith(
            isLoaded: true,
            cost: state.cost - dish.cost,
            cart: newCart,
          ),
        );
      }
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          isInit: false,
          errorMessage: e,
        ),
      );
    }
  }
}
