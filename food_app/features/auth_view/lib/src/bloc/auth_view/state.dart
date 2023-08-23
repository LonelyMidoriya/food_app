part of 'bloc.dart';

class AuthViewState {
  final bool isLoaded;
  final bool isLoggedIn;
  final bool isError;
  final Object errorMessage;
  final UserModel user;

  const AuthViewState({
    required this.isLoaded,
    required this.isLoggedIn,
    required this.isError,
    required this.errorMessage,
    required this.user,
  });

  AuthViewState.empty()
      : isLoaded = false,
        isLoggedIn = false,
        isError = false,
        user = UserModel.empty(),
        errorMessage = '';

  AuthViewState copyWith({
    bool? isLoaded,
    bool? isLoggedIn,
    bool? isError,
    Object? errorMessage,
    UserModel? user,
  }) =>
      AuthViewState(
        isLoaded: isLoaded ?? this.isLoaded,
        isLoggedIn: isLoggedIn ?? this.isLoggedIn,
        isError: isError ?? this.isError,
        errorMessage: errorMessage ?? this.errorMessage,
        user: user ?? this.user,
      );
}
