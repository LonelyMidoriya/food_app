import 'package:core/consts/consts.dart';
import 'package:core/core.dart';
import 'package:dishes_view/src/ui/dish_description_page.dart';
import 'package:domain/domain.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/usecase.dart';
import 'package:flutter/material.dart';

part 'event.dart';
part 'state.dart';

class DishesViewBloc extends Bloc<DishesViewEvent, DishesViewState> {
  final GetInitDishesUseCase _getInitDishesUseCase;
  final GetNextDishesUseCase _getNextDishesUseCase;

  DishesViewBloc({
    required GetInitDishesUseCase getInitDishesUseCase,
    required GetNextDishesUseCase getNextDishesUseCase,
  })  : _getInitDishesUseCase = getInitDishesUseCase,
        _getNextDishesUseCase = getNextDishesUseCase,
        super(
          DishesViewState(
            isLoaded: false,
            isError: false,
            dishes: [],
            isLastPage: false,
            errorMessage: '',
          ),
        ) {
    on<InitEvent>(_loadInit);
    on<LoadEvent>(_load);
    on<NavigateToDetailsEvent>(_navigateToChosenPokemon);
  }

  Future<void> _load(LoadEvent event, Emitter<DishesViewState> emit) async {
    emit(
      state.copyWith(isLoaded: false, isError: false),
    );
    try {
      final List<DishModel> loadedDishes =
          await _getNextDishesUseCase.execute(const NoParams());
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
          isInit: false,
        ),
      );
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

  Future<void> _loadInit(InitEvent event, Emitter<DishesViewState> emit) async {
    emit(
      state.copyWith(isLoaded: false, isError: false),
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
          isInit: false,
        ),
      );
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

  void _navigateToChosenPokemon(
    NavigateToDetailsEvent event,
    Emitter<DishesViewState> emit,
  ) {
    Navigator.of(event.context).push(
      MaterialPageRoute(
        builder: (_) => DishDescriptionPage(
          model: event.model,
        ),
      ),
    );
  }
}
