part of 'bloc.dart';

class DishesViewState {
  List<DishModel> dishes;
  bool isLastPage;
  bool isLoaded;
  bool isError;
  Object errorMessage;
  bool hasInternet;

  DishesViewState({
    required this.dishes,
    required this.isLastPage,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
    required this.hasInternet,
  });

  DishesViewState.empty()
      : dishes = [],
        isError = false,
        isLoaded = false,
        isLastPage = false,
        errorMessage = '',
        hasInternet = true;

  DishesViewState copyWith({
    List<DishModel>? dishes,
    bool? isLastPage,
    bool? isLoaded,
    bool? isError,
    Object? errorMessage,
    bool? hasInternet,
  }) =>
      DishesViewState(
        dishes: dishes ?? this.dishes,
        isLastPage: isLastPage ?? this.isLastPage,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        hasInternet: hasInternet ?? this.hasInternet,
      );
}
