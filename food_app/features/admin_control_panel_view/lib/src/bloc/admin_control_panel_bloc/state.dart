part of 'bloc.dart';

class AdminControlPanelState {
  final bool isLoaded;
  final bool isError;
  final bool hasInternet;
  final Object errorMessage;
  final List<UserModel> users;

  const AdminControlPanelState({
    required this.isLoaded,
    required this.isError,
    required this.errorMessage,
    required this.users,
    required this.hasInternet,
  });

  AdminControlPanelState.empty()
      : isLoaded = false,
        isError = false,
        hasInternet = true,
        users = [],
        errorMessage = '';

  AdminControlPanelState copyWith({
    bool? isLoaded,
    bool? isError,
    bool? hasInternet,
    Object? errorMessage,
    List<UserModel>? users,
  }) =>
      AdminControlPanelState(
        isLoaded: isLoaded ?? this.isLoaded,
        isError: isError ?? this.isError,
        hasInternet: hasInternet ?? this.hasInternet,
        errorMessage: errorMessage ?? this.errorMessage,
        users: users ?? this.users,
      );
}
