part of 'bloc.dart';

class DishesViewState {
  List<DishModel> dishes;
  bool isLastPage;
  DishesStates status;
  Object errorMessage;

  DishesViewState({
    required this.dishes,
    required this.isLastPage,
    required this.status,
    required this.errorMessage,
  });

  DishesViewState copyWith({
    List<DishModel>? dishes,
    bool? isLastPage,
    required DishesStates status,
    Object? errorMessage,
  }) =>
      DishesViewState(
        dishes: dishes == null ? this.dishes : [...this.dishes, ...dishes],
        isLastPage: isLastPage ?? this.isLastPage,
        status: status,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
