import '../model/user_model.dart';

abstract class UserRepository {
  Future<List<UserModel>> getUsers();

  Future<UserModel> getUser();

  Future<void> addUser();

  Future<void> updateUser(UserModel user);

  Future<List<UserModel>> getSearchedUsers(String searchQuery);
}