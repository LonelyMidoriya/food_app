part of 'bloc.dart';

abstract class DishesViewState {}

class EmptyState extends DishesViewState {}

class LoadingState extends DishesViewState {}

class LoadedState extends DishesViewState {
  final List<DishModel> dishes;
  final bool isLastPage;

  LoadedState({required this.dishes, required this.isLastPage});
}

class ErrorState extends DishesViewState {
  final String errorMessage;

  ErrorState({required this.errorMessage});
}