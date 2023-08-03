import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class OrdersViewBloc extends Bloc<OrdersViewEvent, OrdersViewState> {
  final GetOrdersUseCase _getOrdersUseCase;
  final UpdateOrdersUseCase _updateOrdersUseCase;

  OrdersViewBloc({
    required GetOrdersUseCase getOrdersUseCase,
    required UpdateOrdersUseCase updateOrdersUseCase,
  })  : _getOrdersUseCase = getOrdersUseCase,
        _updateOrdersUseCase = updateOrdersUseCase,
        super(
          OrdersViewState.empty(),
        ) {
    on<InitOrdersEvent>(_init);
    on<AddToOrdersEvent>(_addToOrders);
    on<CheckInternetOrdersEvent>(_checkInternet);
  }

  Future<void> _checkInternet(
    CheckInternetOrdersEvent event,
    Emitter<OrdersViewState> emit,
  ) async {
    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;
    emit(
      state.copyWith(hasInternet: hasInternet),
    );
  }

  Future<void> _init(
    InitOrdersEvent event,
    Emitter<OrdersViewState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        hasInternet: true,
        orders: OrdersModel(
          carts: [],
        ),
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
        final OrdersModel ordersModel =
            await _getOrdersUseCase.execute(const NoParams());

        emit(state.copyWith(
          isLoaded: true,
          orders: ordersModel,
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

  Future<void> _addToOrders(
    AddToOrdersEvent event,
    Emitter<OrdersViewState> emit,
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
        if (state.orders.carts.isEmpty) {
          final String date = DateTime.now().toString();
          final CartModel newCartModel = event.cartModel.copyWith(
            cost: event.cost,
            id: 1,
            date: date,
          );
          final OrdersModel newModel = OrdersModel(carts: [newCartModel]);
          _updateOrdersUseCase.execute(newModel);
          emit(
            state.copyWith(
              orders: newModel,
              isLoaded: true,
              isError: false,
            ),
          );
        } else {
          final OrdersModel newModel = state.orders;

          final String date = DateTime.now().toString();
          final CartModel newCartModel = event.cartModel.copyWith(
            cost: event.cost,
            id: newModel.carts.last.id + 1,
            date: date,
          );

          newModel.carts.add(newCartModel);
          _updateOrdersUseCase.execute(newModel);

          emit(
            state.copyWith(
              orders: newModel,
              isLoaded: true,
              isError: false,
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
