import 'package:core/consts/consts.dart';
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
        super(EmptyState()) {
    on<InitEvent>(_loadInit);
    on<LoadEvent>(_load);
  }

  List<DishModel> dishes = [];
  bool isLastPage = false;

  Future<void> _load(LoadEvent event, Emitter<DishesViewState> emit) async {
    emit(LoadingState());
    try {
      dishes = await _dishesUseCase.getAllDishes();
      if (dishes.length < pageCount){
        isLastPage = true;
      }
      emit(LoadedState(dishes: dishes,isLastPage: isLastPage));
    } catch (e, _) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }

  Future<void> _loadInit(InitEvent event, Emitter<DishesViewState> emit) async {
    emit(LoadingState());
    try {
      isLastPage = false;
      dishes = await _dishesUseCase.getFirstDishes();
      if (dishes.length < pageCount){
        isLastPage = true;
      }
      emit(LoadedState(dishes: dishes,isLastPage: isLastPage));
    } catch (e, _) {
      emit(ErrorState(errorMessage: e.toString()));
    }
  }
}