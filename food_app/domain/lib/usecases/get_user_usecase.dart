import 'package:domain/domain.dart';

class GetUserUseCase implements FutureUseCase<NoParams, UserModel> {
  final UserRepository _userRepository;

  const GetUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _userRepository.getUser();
  }
}
