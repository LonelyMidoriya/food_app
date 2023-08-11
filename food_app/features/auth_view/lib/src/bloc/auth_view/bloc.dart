import 'package:core/core.dart';
import 'package:domain/domain.dart';

part 'event.dart';
part 'state.dart';

class AuthViewBloc extends Bloc<AuthViewEvent, AuthViewState> {
  final SignUpWithEmailAndPasswordUsecase _signUpUsecase;
  final LogInUsecase _logInUsecase;
  final SignOutUsecase _signOutUsecase;
  final SignUpWithGoogleUsecase _signUpWithGoogleUsecase;
  final CheckIfLoggedInUsecase _initUserUsecase;

  AuthViewBloc({
    required SignUpWithEmailAndPasswordUsecase signUpUsecase,
    required LogInUsecase logInUsecase,
    required SignOutUsecase signOutUsecase,
    required SignUpWithGoogleUsecase signUpWithGoogleUsecase,
    required CheckIfLoggedInUsecase initUserUsecase,
  })  : _signUpUsecase = signUpUsecase,
        _logInUsecase = logInUsecase,
        _signOutUsecase = signOutUsecase,
        _signUpWithGoogleUsecase = signUpWithGoogleUsecase,
        _initUserUsecase = initUserUsecase,
        super(
          const AuthViewState.empty(),
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
    final bool isLoggedIn = await _initUserUsecase.execute(const NoParams());

    emit(
      state.copyWith(
        isLoggedIn: isLoggedIn,
        isError: false,
      ),
    );
  }

  Future<void> _signUpWithGoogle(
    UserSignupWithGoogleEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      await _signUpWithGoogleUsecase.execute(const NoParams());

      emit(
        state.copyWith(
          isLoggedIn: true,
          isLoaded: true,
          isError: false,
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

      emit(
        state.copyWith(
          isLoggedIn: true,
          isLoaded: true,
          isError: false,
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
      await appLocator.get<SharedPreferences>().setBool(
            'isLoggedIn',
            true,
          );
      await appLocator.get<SharedPreferences>().setString(
            'uid',
            firebaseAuth.currentUser!.uid,
          );
      await appLocator.get<SharedPreferences>().setString(
            'email',
            firebaseAuth.currentUser!.email!,
          );
      emit(
        state.copyWith(
          isLoggedIn: true,
          isLoaded: true,
          isError: false,
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
