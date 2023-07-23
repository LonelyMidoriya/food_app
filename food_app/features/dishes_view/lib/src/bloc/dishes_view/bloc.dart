import 'package:core/consts/consts.dart';
import 'package:core/core.dart';
import 'package:core/di/app_di.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/get_dishes_from_db_usecase.dart';
import 'package:domain/usecases/save_dishes_to_db_usecase.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter/material.dart';
import 'package:navigation/routes/app_router.dart';

part 'event.dart';
part 'state.dart';

class DishesViewBloc extends Bloc<DishesViewEvent, DishesViewState> {
  final GetInitDishesUseCase _getInitDishesUseCase;
  final GetNextDishesUseCase _getNextDishesUseCase;
  final GetDishesFromDBUseCase _getDishesFromDBUseCase;
  final SaveDishesToDBUsecase _saveDishesToDBUsecase;

  DishesViewBloc({
    required GetInitDishesUseCase getInitDishesUseCase,
    required GetNextDishesUseCase getNextDishesUseCase,
    required GetDishesFromDBUseCase getDishesFromDBUseCase,
    required SaveDishesToDBUsecase saveDishesToDBUsecase,
  })  : _getInitDishesUseCase = getInitDishesUseCase,
        _getNextDishesUseCase = getNextDishesUseCase,
        _getDishesFromDBUseCase = getDishesFromDBUseCase,
        _saveDishesToDBUsecase = saveDishesToDBUsecase,
        super(
          DishesViewState.empty(),
        ) {
    on<InitDishesEvent>(_loadInit);
    on<LoadDishesEvent>(_load);
    on<NavigateToDetailsEvent>(_navigateToDishDetails);
    on<CheckInternetDishesEvent>(_checkInternet);
  }

  Future<void> _checkInternet(
    CheckInternetDishesEvent event,
    Emitter<DishesViewState> emit,
  ) async {
    final bool hasInternet = await internetConnection.hasInternetAccess;
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

    add(CheckInternetDishesEvent());

    try {
      if (state.hasInternet) {
        final List<DishModel> loadedDishes =
            await _getNextDishesUseCase.execute(
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
      } else {
        final List<DishModel> allDishes = await _getDishesFromDBUseCase.execute(
          const NoParams(),
        );
        emit(
          state.copyWith(
            dishes: allDishes,
            isLastPage: true,
            isLoaded: true,
          ),
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

    add(CheckInternetDishesEvent());

    try {
      if (state.hasInternet) {
        _saveDishesToDBUsecase.execute(const NoParams());

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
      } else {
        final List<DishModel> allDishes = await _getDishesFromDBUseCase.execute(
          const NoParams(),
        );
        emit(
          state.copyWith(
            dishes: allDishes,
            isLastPage: true,
            isLoaded: true,
          ),
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

  void _navigateToDishDetails(
    NavigateToDetailsEvent event,
    Emitter<DishesViewState> emit,
  ) {
    appRouter.navigate(
      DishDescriptionPageRoute(
        model: event.model,
        hasInternet: state.hasInternet,
      ),
    );
  }
}
