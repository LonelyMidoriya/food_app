import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

part 'event.dart';
part 'state.dart';

class DishesViewBloc extends Bloc<DishesViewEvent, DishesViewState> {
  final GetInitDishesUseCase _getInitDishesUseCase;
  final GetNextDishesUseCase _getNextDishesUseCase;
  final GetDishesByTypeUseCase _getDishesByTypeUseCase;
  final InternetConnection _internetConnection;

  DishesViewBloc({
    required GetInitDishesUseCase getInitDishesUseCase,
    required GetNextDishesUseCase getNextDishesUseCase,
    required GetDishesByTypeUseCase getDishesByTypeUseCase,
    required InternetConnection internetConnection,
  })  : _getInitDishesUseCase = getInitDishesUseCase,
        _getNextDishesUseCase = getNextDishesUseCase,
        _getDishesByTypeUseCase = getDishesByTypeUseCase,
        _internetConnection = internetConnection,
        super(
          DishesViewState.empty(),
        ) {
    on<InitDishesEvent>(_loadInit);
    on<LoadDishesEvent>(_load);
    on<NavigateToDetailsEvent>(_navigateToDishDetails);

    on<LoadDishesByTypeEvent>(_selectType);
    on<SetInternetDishesEvent>(_setInternet);
    final listener = _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        switch (status) {
          case InternetStatus.connected:
            add(SetInternetDishesEvent(hasInternet: true));
            break;
          case InternetStatus.disconnected:
            add(SetInternetDishesEvent(hasInternet: false));
            break;
        }
      },
    );
  }

  Future<void> _selectType(
    LoadDishesByTypeEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        selectedType: event.selectedType,
        dishes: [],
        isLastPage: true,
      ),
    );

    if (event.type != 'all') {
      final List<DishModel> loadedDishes =
          await _getDishesByTypeUseCase.execute(event.type);
      emit(
        state.copyWith(
          dishes: loadedDishes,
          isLastPage: true,
          isLoaded: true,
        ),
      );
    } else {
      add(InitDishesEvent());
    }
  }

  Future<void> _setInternet(
    SetInternetDishesEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    emit(
      state.copyWith(hasInternet: event.hasInternet),
    );
  }

  Future<void> _load(
    LoadDishesEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    emit(
      state.copyWith(isLoaded: false, isError: false),
    );

    try {
      final List<DishModel> loadedDishes = await _getNextDishesUseCase.execute(
        const NoParams(),
      );
      final List<DishModel> allDishes = [...state.dishes, ...loadedDishes];
      bool isLastPage = false;

      if (loadedDishes.length < pageCount) {
        isLastPage = true;
      }
      emit(
        state.copyWith(
          dishes: allDishes,
          isLastPage: isLastPage,
          isLoaded: true,
        ),
      );
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _loadInit(
      InitDishesEvent event, Emitter<DishesViewState> emit) async {
    emit(
      state.copyWith(
        isLoaded: false,
        isError: false,
        dishes: [],
        isLastPage: true,
      ),
    );

    try {
      final List<DishModel> loadedDishes =
          await _getInitDishesUseCase.execute(const NoParams());
      bool isLastPage = false;

      if (loadedDishes.length < pageCount) {
        isLastPage = true;
      }
      emit(
        state.copyWith(
          dishes: loadedDishes,
          isLastPage: isLastPage,
          isLoaded: true,
        ),
      );
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }

  void _navigateToDishDetails(
    NavigateToDetailsEvent event,
    Emitter<DishesViewState> emit,
  ) {
    appRouter.navigate(
      DishDescriptionPageRoute(
        model: event.model,
      ),
    );
  }
}
