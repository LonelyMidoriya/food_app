import 'package:core/consts/consts.dart';
import 'package:core/consts/dishes_states.dart';
import 'package:core/core.dart';
import 'package:domain/model/dish_model.dart';
import 'package:domain/usecases/dishes_use_cases.dart';

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
}
