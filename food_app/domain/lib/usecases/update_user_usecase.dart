import 'package:domain/domain.dart';

class UpdateUserUseCase implements FutureUseCase<UserModel, void> {
  final UserRepository _userRepository;

  const UpdateUserUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<void> execute(UserModel input) async {
    _userRepository.updateUser(input);
  }
}
