import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:flutter/cupertino.dart';
import 'package:navigation/navigation.dart';

part 'event.dart';
part 'state.dart';

class AuthViewBloc extends Bloc<AuthViewEvent, AuthViewState> {
  final SignUpWithEmailAndPasswordUsecase _signUpWithEmailAndPasswordUsecase;
  final LogInUsecase _logInUsecase;
  final AddUserUseCase _addUserUsecase;
  final FetchUserUseCase _fetchUserUseCase;
  final SignOutUsecase _signOutUsecase;
  final SignUpWithGoogleUsecase _signUpWithGoogleUsecase;
  final CheckIfLoggedInUsecase _checkIfLoggedInUsecase;

  AuthViewBloc({
    required SignUpWithEmailAndPasswordUsecase
        signUpWithEmailAndPasswordUsecase,
    required LogInUsecase logInUsecase,
    required SignOutUsecase signOutUsecase,
    required SignUpWithGoogleUsecase signUpWithGoogleUsecase,
    required CheckIfLoggedInUsecase checkIfLoggedInUsecase,
    required AddUserUseCase addUserUsecase,
    required FetchUserUseCase fetchUserUseCase,
  })  : _signUpWithEmailAndPasswordUsecase = signUpWithEmailAndPasswordUsecase,
        _logInUsecase = logInUsecase,
        _signOutUsecase = signOutUsecase,
        _signUpWithGoogleUsecase = signUpWithGoogleUsecase,
        _checkIfLoggedInUsecase = checkIfLoggedInUsecase,
        _addUserUsecase = addUserUsecase,
        _fetchUserUseCase = fetchUserUseCase,
        super(
          AuthViewState.empty(),
        ) {
    on<AuthInitEvent>(_init);
    on<UserSignupWithEmailAndPasswordEvent>(_signUpWithEmailAndPassword);
    on<UserSignupWithGoogleEvent>(_signUpWithGoogle);
    on<UserSignoutEvent>(_signOut);
    on<UserLogInEvent>(_logIn);
    on<NavigateToPageEvent>(_navigateTo);
    on<PopUntilPageEvent>(_popUntil);
    on<PopToPreviousPageEvent>(_popToPage);
  }

  Future<void> _init(
    AuthInitEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      final bool isLoggedIn =
          await _checkIfLoggedInUsecase.execute(const NoParams());

      if (isLoggedIn) {
        UserModel user = await _fetchUserUseCase.execute(const NoParams());

        if (user.email.isEmpty) {
          await _addUserUsecase.execute(const NoParams());
          user = await _fetchUserUseCase.execute(const NoParams());
        }

        emit(
          state.copyWith(
            isLoggedIn: true,
            isError: false,
            user: user,
          ),
        );
      } else {
        emit(
          state.copyWith(
            isLoggedIn: isLoggedIn,
            isError: false,
          ),
        );
      }
    } catch (e) {
      emit(
        state.copyWith(
          isError: true,
          errorMessage: e,
        ),
      );
    }
  }

  Future<void> _signUpWithGoogle(
    UserSignupWithGoogleEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      await _signUpWithGoogleUsecase.execute(const NoParams());

      UserModel user = await _fetchUserUseCase.execute(const NoParams());

      if (user.email.isEmpty) {
        await _addUserUsecase.execute(const NoParams());
        user = await _fetchUserUseCase.execute(const NoParams());
      }

      emit(
        state.copyWith(
          isLoggedIn: true,
          isLoaded: true,
          isError: false,
          user: user,
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

  Future<void> _signOut(
    UserSignoutEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      await _signOutUsecase.execute(const NoParams());

      emit(
        state.copyWith(
          isLoggedIn: false,
          isLoaded: false,
          isError: false,
          user: UserModel.empty(),
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

  Future<void> _signUpWithEmailAndPassword(
    UserSignupWithEmailAndPasswordEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      final Credentials credentials = Credentials(
        email: event.email,
        password: event.password,
      );
      await _signUpWithEmailAndPasswordUsecase.execute(credentials);

      await _addUserUsecase.execute(const NoParams());
      final UserModel user = await _fetchUserUseCase.execute(const NoParams());

      emit(
        state.copyWith(
          isLoggedIn: true,
          isLoaded: true,
          isError: false,
          user: user,
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

  Future<void> _navigateTo(
    NavigateToPageEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    appRouter.navigate(
      event.route,
    );
  }

  Future<void> _popToPage(
      PopToPreviousPageEvent event,
      Emitter<AuthViewState> emit,
      ) async {
    appRouter.pop();
  }

  Future<void> _popUntil(
      PopUntilPageEvent event,
      Emitter<AuthViewState> emit,
      ) async {
    appRouter.popUntilRouteWithName(
      event.route,
    );
  }

  Future<void> _logIn(
    UserLogInEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      final Credentials credentials = Credentials(
        email: event.email,
        password: event.password,
      );
      await _logInUsecase.execute(credentials);

      UserModel user = await _fetchUserUseCase.execute(const NoParams());

      if (user.email.isEmpty) {
        await _addUserUsecase.execute(const NoParams());
        user = await _fetchUserUseCase.execute(const NoParams());
      }

      emit(
        state.copyWith(
          isLoggedIn: true,
          isLoaded: true,
          isError: false,
          user: user,
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
