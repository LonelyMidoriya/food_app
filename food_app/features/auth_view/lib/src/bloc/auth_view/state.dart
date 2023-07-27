part of 'bloc.dart';

class AuthViewState {
  final bool isLoaded;
  final bool isLoggedIn;
  final bool isError;
  final Object errorMessage;

  AuthViewState({
    required this.isLoaded,
    required this.isLoggedIn,
    required this.isError,
    required this.errorMessage,
  });

  AuthViewState.empty()
      : isLoaded = false,
        isLoggedIn = false,
        isError = false,
        errorMessage = '';

  AuthViewState copyWith({
    bool? isLoaded,
    bool? isLoggedIn,
    bool? isError,
    Object? errorMessage,
  }) =>
      AuthViewState(
        isLoaded: isLoaded ?? this.isLoaded,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
      );
}
