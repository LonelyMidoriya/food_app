import 'package:core/consts/consts.dart';
import 'package:core/consts/dishes_states.dart';
import 'package:core/core.dart';
import 'package:dishes_view/src/ui/dish_description_page.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/dishes_use_cases.dart';
import 'package:flutter/material.dart';

part 'event.dart';
part 'state.dart';

class DishesViewBloc extends Bloc<DishesViewEvent, DishesViewState> {
  final DishesUseCase _dishesUseCase;

  DishesViewBloc({
    required DishesUseCase dishesUseCase,
  })  : _dishesUseCase = dishesUseCase,
        super(DishesViewState(
          status: DishesStates.EMPTY,
          dishes: [],
          isLastPage: false,
          errorMessage: '',
        )) {
    on<InitEvent>(_loadInit);
    on<LoadEvent>(_load);
    on<NavigateToDetailsEvent>(_navigateToChosenPokemon);
  }

  Future<void> _load(LoadEvent event, Emitter<DishesViewState> emit) async {
    emit(state.copyWith(status: DishesStates.LOADING));
    try {
      final List<DishModel> loadedDishes = await _dishesUseCase.getAllDishes();
      bool isLastPage = false;
      if (loadedDishes.length < pageCount) {
        isLastPage = true;
      }
      emit(state.copyWith(
        dishes: loadedDishes,
        isLastPage: isLastPage,
        status: DishesStates.LOADED,
      ));
    } catch (e, _) {
      emit(state.copyWith(
        status: DishesStates.ERROR,
        errorMessage: e,
      ));
    }
  }

  Future<void> _loadInit(InitEvent event, Emitter<DishesViewState> emit) async {
    emit(state.copyWith(status: DishesStates.LOADING));
    try {
      final List<DishModel> loadedDishes =
          await _dishesUseCase.getFirstDishes();
      bool isLastPage = false;

      if (loadedDishes.length < pageCount) {
        isLastPage = true;
      }
      emit(state.copyWith(
        dishes: loadedDishes,
        isLastPage: isLastPage,
        status: DishesStates.LOADED,
      ));
    } catch (e, _) {
      emit(state.copyWith(
        status: DishesStates.ERROR,
        errorMessage: e,
      ));
    }
  }

  void _navigateToChosenPokemon(
      NavigateToDetailsEvent event, Emitter<DishesViewState> emit) {
    Navigator.of(event.context).push(
      MaterialPageRoute(
        builder: (_) => DishDescriptionPage(event.model),
      ),
    );
  }
}
