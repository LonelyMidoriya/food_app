import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

part 'event.dart';
part 'state.dart';

class DishesViewBloc extends Bloc<DishesViewEvent, DishesViewState> {
  final GetInitDishesUseCase _getInitDishesUseCase;
  final GetNextDishesUseCase _getNextDishesUseCase;
  final GetDishesByTypeUseCase _getDishesByTypeUseCase;

  DishesViewBloc({
    required GetInitDishesUseCase getInitDishesUseCase,
    required GetNextDishesUseCase getNextDishesUseCase,
    required GetDishesByTypeUseCase getDishesByTypeUseCase,
  })  : _getInitDishesUseCase = getInitDishesUseCase,
        _getNextDishesUseCase = getNextDishesUseCase,
        _getDishesByTypeUseCase = getDishesByTypeUseCase,
        super(
          DishesViewState.empty(),
        ) {
    on<InitDishesEvent>(_loadInit);
    on<LoadDishesEvent>(_load);
    on<NavigateToDetailsEvent>(_navigateToDishDetails);
    on<CheckInternetDishesEvent>(_checkInternet);
    on<LoadDishesByTypeEvent>(_selectType);
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
      final bool hasInternet =
          await appLocator.get<InternetConnection>().hasInternetAccess;

      final List<DishModel> loadedDishes =
          await _getDishesByTypeUseCase.execute(
        [event.type, hasInternet],
      );
      emit(
        state.copyWith(
          hasInternet: hasInternet,
          dishes: loadedDishes,
          isLastPage: true,
          isLoaded: true,
        ),
      );
    } else {
      add(InitDishesEvent());
    }
  }

  Future<void> _checkInternet(
    CheckInternetDishesEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    final bool hasInternet =
        await appLocator.get<InternetConnection>().hasInternetAccess;
    emit(
      state.copyWith(hasInternet: hasInternet),
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
      final bool hasInternet =
          await appLocator.get<InternetConnection>().hasInternetAccess;
      final List<DishModel> loadedDishes =
          await _getInitDishesUseCase.execute(hasInternet);
      bool isLastPage = false;

      if (loadedDishes.length < pageCount) {
        isLastPage = true;
      }
      emit(
        state.copyWith(
          hasInternet: hasInternet,
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
