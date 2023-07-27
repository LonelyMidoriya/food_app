import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:domain/usecases/usecase.dart';

part 'event.dart';
part 'state.dart';

class AuthViewBloc extends Bloc<AuthViewEvent, AuthViewState> {
  final SignUpUsecase _signUpUsecase;
  final LogInUsecase _logInUsecase;
  final SignOutUsecase _signOutUsecase;
  final SignUpWithGoogleUsecase _signUpWithGoogleUsecase;

  AuthViewBloc({
    required SignUpUsecase signUpUsecase,
    required LogInUsecase logInUsecase,
    required SignOutUsecase signOutUsecase,
    required SignUpWithGoogleUsecase signUpWithGoogleUsecase,
  })  : _signUpUsecase = signUpUsecase,
        _logInUsecase = logInUsecase,
        _signOutUsecase = signOutUsecase,
        _signUpWithGoogleUsecase = signUpWithGoogleUsecase,
        super(
          AuthViewState.empty(),
        ) {
    on<AuthInitEvent>(_init);
    on<UserSignupEvent>(_signUp);
    on<UserSignupWithGoogleEvent>(_signUpWithGoogle);
    on<UserSignoutEvent>(_signOut);
    on<UserLogInEvent>(_logIn);
  }

  Future<void> _init(
    AuthInitEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    final bool? isLoggedIn;

    if (firebaseAuth.currentUser == null) {
      await appLocator.get<SharedPreferences>().setBool(
            'isLoggedIn',
            false,
          );
      await appLocator.get<SharedPreferences>().setString(
            'uid',
            '',
          );
      await appLocator.get<SharedPreferences>().setString(
            'email',
            '',
          );
      isLoggedIn = false;
    } else {
      isLoggedIn = await appLocator.get<SharedPreferences>().getBool(
            'isLoggedIn',
          );
    }
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

  Future<void> _signOut(
    UserSignoutEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      await _signOutUsecase.execute(const NoParams());
      await appLocator.get<SharedPreferences>().setBool(
            'isLoggedIn',
            false,
          );
      await appLocator.get<SharedPreferences>().setString(
            'uid',
            '',
          );
      await appLocator.get<SharedPreferences>().setString(
            'email',
            '',
          );
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

  Future<void> _signUp(
    UserSignupEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      await _signUpUsecase.execute(
        [
          event.email,
          event.password,
        ],
      );
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

  Future<void> _logIn(
    UserLogInEvent event,
    Emitter<AuthViewState> emit,
  ) async {
    try {
      await _logInUsecase.execute(
        [
          event.email,
          event.password,
        ],
      );
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
