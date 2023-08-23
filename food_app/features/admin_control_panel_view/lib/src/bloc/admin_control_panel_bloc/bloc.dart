import 'dart:async';

import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class AdminControlPanelBloc
    extends Bloc<AdminControlPanelEvent, AdminControlPanelState> {
  final GetAllUsersUseCase _getAllUsersUseCase;
  final GetSearchedUsersUseCase _getSearchedUsersUseCase;
  final UpdateUserUseCase _updateUserUseCase;
  final InternetConnection _internetConnection;

  AdminControlPanelBloc({
    required GetAllUsersUseCase getAllUsersUseCase,
    required GetSearchedUsersUseCase getSearchedUsersUseCase,
    required UpdateUserUseCase updateUserUseCase,
    required InternetConnection internetConnection,
  })  : _getAllUsersUseCase = getAllUsersUseCase,
        _getSearchedUsersUseCase = getSearchedUsersUseCase,
        _updateUserUseCase = updateUserUseCase,
        _internetConnection = internetConnection,
        super(
          AdminControlPanelState.empty(),
        ) {
    on<AdminControlPanelInitEvent>(_init);
    on<GiveAdminRightsEvent>(_giveAdmin);
    on<TakeAdminRightsEvent>(_takeAdmin);
    on<SetInternetAdminEvent>(_setInternet);
    on<GetSearchedUsersEvent>(_getSearched);
    final StreamSubscription<InternetStatus> listener =
        _internetConnection.onStatusChange.listen(
      (InternetStatus status) {
        if (status == InternetStatus.connected) {
          add(SetInternetAdminEvent(hasInternet: true));
        } else {
          add(SetInternetAdminEvent(hasInternet: false));
        }
      },
    );
  }

  Future<void> _setInternet(
    SetInternetAdminEvent event,
    Emitter<AdminControlPanelState> emit,
  ) async {
    emit(
      state.copyWith(hasInternet: event.hasInternet),
    );
  }

  Future<void> _init(
    AdminControlPanelInitEvent event,
    Emitter<AdminControlPanelState> emit,
  ) async {
    try {
      final List<UserModel> users =
          await _getAllUsersUseCase.execute(const NoParams());

      users.sort(
        (a, b) {
          if (a.isAdmin == b.isAdmin) {
            return a.email.compareTo(b.email);
          } else {
            if (b.isAdmin) {
              return 1;
            }
            return -1;
          }
        },
      );

      emit(
        state.copyWith(
          isLoaded: true,
          isError: false,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _giveAdmin(
    GiveAdminRightsEvent event,
    Emitter<AdminControlPanelState> emit,
  ) async {
    try {
      await _updateUserUseCase.execute(
        event.user.copyWith(
          isAdmin: true,
        ),
      );

      emit(
        state.copyWith(
          isLoaded: false,
        ),
      );

      final List<UserModel> newUsers = state.users;
      final int index = state.users
          .indexWhere((UserModel element) => element.email == event.user.email);

      newUsers[index] = event.user.copyWith(
        isAdmin: true,
      );

      newUsers.sort(
        (a, b) {
          if (a.isAdmin == b.isAdmin) {
            return a.email.compareTo(b.email);
          } else {
            if (b.isAdmin) {
              return 1;
            }
            return -1;
          }
        },
      );

      emit(
        state.copyWith(
          isLoaded: true,
          isError: false,
          users: newUsers,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _takeAdmin(
    TakeAdminRightsEvent event,
    Emitter<AdminControlPanelState> emit,
  ) async {
    try {
      await _updateUserUseCase.execute(
        event.user.copyWith(
          isAdmin: false,
        ),
      );

      emit(
        state.copyWith(
          isLoaded: false,
        ),
      );

      final List<UserModel> newUsers = state.users;
      final int index = state.users
          .indexWhere((UserModel element) => element.email == event.user.email);

      newUsers[index] = event.user.copyWith(
        isAdmin: false,
      );

      newUsers.sort(
        (a, b) {
          if (a.isAdmin == b.isAdmin) {
            return a.email.compareTo(b.email);
          } else {
            if (b.isAdmin) {
              return 1;
            }
            return -1;
          }
        },
      );

      emit(
        state.copyWith(
          isLoaded: true,
          isError: false,
          users: newUsers,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _getSearched(
    GetSearchedUsersEvent event,
    Emitter<AdminControlPanelState> emit,
  ) async {
    try {
      final List<UserModel> users =
          await _getSearchedUsersUseCase.execute(event.searchQuery);

      users.sort(
        (a, b) {
          if (a.isAdmin == b.isAdmin) {
            return a.email.compareTo(b.email);
          } else {
            if (b.isAdmin) {
              return 1;
            }
            return -1;
          }
        },
      );

      emit(
        state.copyWith(
          isLoaded: true,
          isError: false,
          users: users,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }
}
