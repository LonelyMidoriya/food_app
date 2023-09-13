import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class OrdersViewBloc extends Bloc<OrdersViewEvent, OrdersViewState> {
  final FetchOrdersUseCase _fetchOrdersUseCase;
  final UpdateOrdersUseCase _updateOrdersUseCase;
  final InternetConnection _internetConnection;
  final GetAllUsersOrdersUseCase _getAllUsersOrdersUseCase;
  final FetchSearchedUsersOrdersUseCase _getSearchedUsersOrdersUseCase;

  OrdersViewBloc({
    required FetchOrdersUseCase fetchOrdersUseCase,
    required UpdateOrdersUseCase updateOrdersUseCase,
    required InternetConnection internetConnection,
    required GetAllUsersOrdersUseCase getAllUsersOrdersUseCase,
    required FetchSearchedUsersOrdersUseCase getSearchedUsersOrdersUseCase,
  })  : _fetchOrdersUseCase = fetchOrdersUseCase,
        _updateOrdersUseCase = updateOrdersUseCase,
        _internetConnection = internetConnection,
        _getAllUsersOrdersUseCase = getAllUsersOrdersUseCase,
        _getSearchedUsersOrdersUseCase = getSearchedUsersOrdersUseCase,
        super(
          OrdersViewState.empty(),
        ) {
    on<InitOrdersEvent>(_init);
    on<AddToOrdersEvent>(_addToOrders);
    on<SetInternetOrdersEvent>(_setInternet);
    on<InitAdminOrdersEvent>(_initAdmin);
    on<InitAdminSearchedOrdersEvent>(_initAdminSearched);
    final StreamSubscription<InternetStatus> listener =
        _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          add(const SetInternetOrdersEvent(hasInternet: true));
          add(InitOrdersEvent());
        } else {
          add(const SetInternetOrdersEvent(hasInternet: false));
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

  Future<void> _initAdminSearched(
    InitAdminSearchedOrdersEvent event,
    Emitter<OrdersViewState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        allUsersOrders: [],
        errorMessage: '',
      ),
    );

    if (state.hasInternet) {
      try {
        final List<OrderHistoryModel> orders =
            await _getSearchedUsersOrdersUseCase.execute(event.searchQuery);

        emit(
          state.copyWith(
            isLoaded: true,
            allUsersOrders: orders,
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

  Future<void> _initAdmin(
    InitAdminOrdersEvent event,
    Emitter<OrdersViewState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        allUsersOrders: [],
        errorMessage: '',
      ),
    );

    if (state.hasInternet) {
      try {
        final List<OrderHistoryModel> orders =
            await _getAllUsersOrdersUseCase.execute(const NoParams());

        emit(
          state.copyWith(
            isLoaded: true,
            allUsersOrders: orders,
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

  Future<void> _init(
    InitOrdersEvent event,
    Emitter<OrdersViewState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        orders: const OrderHistoryModel(
          carts: [],
          email: '',
        ),
        errorMessage: '',
      ),
    );

    if (state.hasInternet) {
      try {
        final OrderHistoryModel ordersModel =
            await _fetchOrdersUseCase.execute(const NoParams());

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
          final OrderHistoryModel newModel = OrderHistoryModel(
            carts: [newCartModel],
            email: event.email,
          );
          _updateOrdersUseCase.execute(newModel);
          emit(
            state.copyWith(
              orders: newModel,
              isLoaded: true,
              isError: false,
            ),
          );
        } else {
          final OrderHistoryModel newModel = state.orders;

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
