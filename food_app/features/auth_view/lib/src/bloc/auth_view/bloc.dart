import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class AuthViewBloc extends Bloc<AuthViewEvent, AuthViewState> {
  final SignUpWithEmailAndPasswordUsecase _signUpUsecase;
  final LogInUsecase _logInUsecase;
  final AddUserUseCase _addUserUsecase;
  final GetUserUseCase _getUserUseCase;
  final SignOutUsecase _signOutUsecase;
  final SignUpWithGoogleUsecase _signUpWithGoogleUsecase;
  final CheckIfLoggedInUsecase _checkIfLoggedInUsecase;

  AuthViewBloc({
    required SignUpWithEmailAndPasswordUsecase signUpUsecase,
    required LogInUsecase logInUsecase,
    required SignOutUsecase signOutUsecase,
    required SignUpWithGoogleUsecase signUpWithGoogleUsecase,
    required CheckIfLoggedInUsecase checkIfLoggedInUsecase,
    required AddUserUseCase addUserUsecase,
    required GetUserUseCase getUserUseCase,
  })  : _signUpUsecase = signUpUsecase,
        _logInUsecase = logInUsecase,
        _signOutUsecase = signOutUsecase,
        _signUpWithGoogleUsecase = signUpWithGoogleUsecase,
        _checkIfLoggedInUsecase = checkIfLoggedInUsecase,
        _addUserUsecase = addUserUsecase,
        _getUserUseCase = getUserUseCase,
        super(
          AuthViewState.empty(),
        ) {
    on<AuthInitEvent>(_init);
    on<UserSignupWithEmailAndPasswordEvent>(_signUpWithEmailAndPassword);
    on<UserSignupWithGoogleEvent>(_signUpWithGoogle);
    on<UserSignoutEvent>(_signOut);
    on<UserLogInEvent>(_logIn);
  }

  Future<void> _init(
    AuthInitEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      final bool isLoggedIn =
          await _checkIfLoggedInUsecase.execute(const NoParams());

      if (isLoggedIn) {
        UserModel user = await _getUserUseCase.execute(const NoParams());

        if (user.email == '') {
          await _addUserUsecase.execute(const NoParams());
          user = await _getUserUseCase.execute(const NoParams());
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

      UserModel user = await _getUserUseCase.execute(const NoParams());

      if (user.email == '') {
        await _addUserUsecase.execute(const NoParams());
        user = await _getUserUseCase.execute(const NoParams());
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
      await _signUpUsecase.execute(credentials);

      UserModel user = await _getUserUseCase.execute(const NoParams());

      if (user.email == '') {
        await _addUserUsecase.execute(const NoParams());
        user = await _getUserUseCase.execute(const NoParams());
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

      UserModel user = await _getUserUseCase.execute(const NoParams());

      if (user.email == '') {
        await _addUserUsecase.execute(const NoParams());
        user = await _getUserUseCase.execute(const NoParams());
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
