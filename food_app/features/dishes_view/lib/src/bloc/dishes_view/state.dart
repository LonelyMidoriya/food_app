part of 'bloc.dart';

class DishesViewState {
  List<DishModel> dishes;
  bool isLastPage;
  bool isLoaded;
  bool isError;
  Object errorMessage;

  DishesViewState({
    required this.dishes,
    required this.isLastPage,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
  });

  DishesViewState copyWith({
    List<DishModel>? dishes,
    bool? isLastPage,
    bool? isLoaded,
    bool? isError,
    bool? isInit,
    Object? errorMessage,
  }) =>
      DishesViewState(
        dishes: dishes ?? this.dishes,
        isLastPage: isLastPage ?? this.isLastPage,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
