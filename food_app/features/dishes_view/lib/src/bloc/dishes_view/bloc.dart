import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class DishesViewBloc extends Bloc<DishesViewEvent, DishesViewState> {
  final FetchInitDishesUseCase _fetchInitDishesUseCase;
  final FetchNextDishesUseCase _fetchNextDishesUseCase;
  final FetchDishesByTypeUseCase _fetchDishesByTypeUseCase;
  final DeleteDishUseCase _deleteDishUseCase;
  final AddDishUseCase _addDishUseCase;
  final InternetConnection _internetConnection;
  final UpdateDishUseCase _updateDishUseCase;

  DishesViewBloc(
      {required FetchInitDishesUseCase fetchInitDishesUseCase,
      required FetchNextDishesUseCase fetchNextDishesUseCase,
      required FetchDishesByTypeUseCase fetchDishesByTypeUseCase,
      required InternetConnection internetConnection,
      required DeleteDishUseCase deleteDishUseCase,
      required AddDishUseCase addDishUseCase,
      required UpdateDishUseCase updateDishUseCase})
      : _fetchInitDishesUseCase = fetchInitDishesUseCase,
        _fetchNextDishesUseCase = fetchNextDishesUseCase,
        _fetchDishesByTypeUseCase = fetchDishesByTypeUseCase,
        _internetConnection = internetConnection,
        _deleteDishUseCase = deleteDishUseCase,
        _addDishUseCase = addDishUseCase,
        _updateDishUseCase = updateDishUseCase,
        super(
          DishesViewState.empty(),
        ) {
    on<InitDishesEvent>(_loadInit);
    on<LoadDishesEvent>(_load);
    on<UpdateDishEvent>(_updateDish);
    on<DeleteDishEvent>(_deleteDish);
    on<LoadDishesByTypeEvent>(_selectType);
    on<SetInternetDishesEvent>(_setInternet);
    on<AddDishEvent>(_addDish);
    final StreamSubscription<InternetStatus> listener =
        _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          add(const SetInternetDishesEvent(hasInternet: true));
        } else {
          add(const SetInternetDishesEvent(hasInternet: false));
        }
      },
    );
  }

  Future<void> _updateDish(
    UpdateDishEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    try {
      await _updateDishUseCase.execute([event.dish, event.newDish]);

      add(
        LoadDishesByTypeEvent(selectedType: state.selectedType),
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

  Future<void> _addDish(
    AddDishEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    try {
      await _addDishUseCase.execute(event.dish);

      add(
        LoadDishesByTypeEvent(selectedType: state.selectedType),
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

  Future<void> _deleteDish(
    DeleteDishEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    try {
      await _deleteDishUseCase.execute(event.dish);

      add(
        LoadDishesByTypeEvent(selectedType: state.selectedType),
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

  Future<void> _selectType(
    LoadDishesByTypeEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    try {
      emit(
        state.copyWith(
          isLoaded: false,
          isError: false,
          selectedType: event.selectedType,
          dishes: [],
          isLastPage: true,
        ),
      );

      final String type = TypeOfFood.values[event.selectedType].name;

      if (type != 'all') {
        final List<DishModel> loadedDishes =
            await _fetchDishesByTypeUseCase.execute(type);
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
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
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
      state.copyWith(
        isLoaded: false,
        isError: false,
      ),
    );

    try {
      final List<DishModel> loadedDishes =
          await _fetchNextDishesUseCase.execute(
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
      if (state.selectedType == 0) {
        final List<DishModel> loadedDishes =
            await _fetchInitDishesUseCase.execute(const NoParams());
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
      } else {
        add(
          LoadDishesByTypeEvent(selectedType: state.selectedType),
        );
      }
    } catch (e, _) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }
}
