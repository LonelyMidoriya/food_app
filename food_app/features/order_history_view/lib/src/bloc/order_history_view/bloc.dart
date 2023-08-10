import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class OrdersViewBloc extends Bloc<OrdersViewEvent, OrdersViewState> {
  final GetOrdersUseCase _getOrdersUseCase;
  final UpdateOrdersUseCase _updateOrdersUseCase;
  final InternetConnection _internetConnection;

  OrdersViewBloc({
    required GetOrdersUseCase getOrdersUseCase,
    required UpdateOrdersUseCase updateOrdersUseCase,
    required InternetConnection internetConnection,
  })  : _getOrdersUseCase = getOrdersUseCase,
        _updateOrdersUseCase = updateOrdersUseCase,
        _internetConnection = internetConnection,
        super(
          OrdersViewState.empty(),
        ) {
    on<InitOrdersEvent>(_init);
    on<AddToOrdersEvent>(_addToOrders);
    on<SetInternetOrdersEvent>(_setInternet);
    final listener = _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            add(SetInternetOrdersEvent(hasInternet: true));
            add(InitOrdersEvent());
            break;
          case InternetStatus.disconnected:
            add(SetInternetOrdersEvent(hasInternet: false));
            break;
        }
      },
    );
  }

  Future<void> _setInternet(
    SetInternetOrdersEvent event,
    Emitter<OrdersViewState> emit,
  ) async {
    emit(
      state.copyWith(hasInternet: event.hasInternet),
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
        orders: OrdersModel(
          carts: [],
        ),
        errorMessage: '',
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
