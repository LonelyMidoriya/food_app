part of 'bloc.dart';

class DishesViewState {
  final List<DishModel> dishes;
  final bool isLastPage;
  final bool isLoaded;
  final bool isError;
  final Object errorMessage;
  final bool hasInternet;
  final int selectedType;

  const DishesViewState({
    required this.dishes,
    required this.isLastPage,
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
    required this.hasInternet,
    required this.selectedType,
  });

  DishesViewState.empty()
      : dishes = [],
        isError = false,
        isLoaded = false,
        isLastPage = false,
        errorMessage = '',
        hasInternet = true,
        selectedType = 0;

  DishesViewState copyWith({
    List<DishModel>? dishes,
    bool? isLastPage,
    bool? isLoaded,
    bool? isError,
    Object? errorMessage,
    bool? hasInternet,
    int? selectedType,
  }) =>
      DishesViewState(
        dishes: dishes ?? this.dishes,
        isLastPage: isLastPage ?? this.isLastPage,
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        hasInternet: hasInternet ?? this.hasInternet,
        selectedType: selectedType ?? this.selectedType,
      );
}
