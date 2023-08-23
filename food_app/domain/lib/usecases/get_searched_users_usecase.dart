import 'package:domain/usecases/usecase.dart';

import '../model/user_model.dart';
import '../repository/user_repository.dart';

class GetSearchedUsersUseCase implements FutureUseCase<String, List<UserModel>> {
  final UserRepository _userRepository;

  const GetSearchedUsersUseCase({
    required UserRepository userRepository,
  }) : _userRepository = userRepository;

  @override
  Future<List<UserModel>> execute(String input) async {
    return _userRepository.getSearchedUsers(input);
  }
}
