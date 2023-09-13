import 'package:domain/domain.dart';

class FetchUserUseCase implements FutureUseCase<NoParams, UserModel> {
  final UserRepository _userRepository;

  const FetchUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<UserModel> execute(NoParams input) async {
    return _userRepository.fetchUser();
  }
}
