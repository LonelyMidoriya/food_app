import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:mocktail/mocktail.dart';

class GetTextSizeUseCaseMock extends Mock implements FetchTextSizeUseCase{
  @override
  Future<double?> execute(NoParams input) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble('textSize');
  }
}

class SaveTextSizeUseCaseMock extends Mock implements SaveTextSizeUseCase{
  @override
  Future<void> execute(double input) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.setDouble('textSize', input);
  }
}

class SignUpWithEmailAndPasswordUsecaseMock extends Mock implements SignUpWithEmailAndPasswordUsecase{}

class LogInUsecaseMock extends Mock implements LogInUsecase{}

class SignOutUsecaseMock extends Mock implements SignOutUsecase{}

class SignUpWithGoogleUsecaseMock extends Mock implements SignUpWithGoogleUsecase{}

class CheckIfLoggedInUsecaseMock extends Mock implements CheckIfLoggedInUsecase{}

class AddUserUseCaseMock extends Mock implements AddUserUseCase{}

class GetUserUseCaseMock extends Mock implements FetchUserUseCase{}
