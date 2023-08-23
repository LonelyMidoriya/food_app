import 'package:core/core.dart';
import 'package:data/data.dart';
import 'package:domain/model/user_model.dart';
import 'package:domain/repository/user_repository.dart';

class UserRepositoryImpl implements UserRepository {
  final FirestoreProvider _firestoreProvider;
  final UserMapper _userMapper;
  final SharedPreferences _sharedPreferences;

  const UserRepositoryImpl({
    required FirestoreProvider firestoreProvider,
    required UserMapper userMapper,
    required SharedPreferences sharedPreferences,
  })  : _userMapper = userMapper,
        _firestoreProvider = firestoreProvider,
        _sharedPreferences = sharedPreferences;

  @override
  Future<UserModel> getUser() async {
    final UserModel userModel = await _firestoreProvider
        .getUser(
      collection: 'users',
      email: _sharedPreferences.getString('email')!,
    ) .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        if (value.docs.isEmpty) {
          return const UserModel(
            email: '',
            uid: '',
            isAdmin: false,
            isSuperAdmin: false,
          );
        }
        return _userMapper.toModel(
          UserEntity.fromJson(
            value.docs.first.data(),
          ),
        );
      },
    );

    return userModel;
  }

  @override
  Future<void> addUser() async {
    final UserModel user = UserModel(
      email: _sharedPreferences.getString('email')!,
      uid: _sharedPreferences.getString('uid')!,
      isAdmin: false,
      isSuperAdmin: false,
    );
    await _firestoreProvider.addUser(
      user: _userMapper.toEntity(user).toJson(),
      collection: 'users',
    );
  }

  @override
  Future<void> updateUser(UserModel user) async {
    await _firestoreProvider.updateUser(
      user: _userMapper.toEntity(user).toJson(),
      collection: 'users',
    );
  }

  @override
  Future<List<UserModel>> getUsers() async {
    final List<UserModel> users = [];
    await _firestoreProvider
        .getUsers(
      collection: 'users',
    ) .then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          users.add(
            _userMapper.toModel(
              UserEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    return users;
  }

  @override
  Future<List<UserModel>> getSearchedUsers(String searchQuery) async {
    final List<UserModel> users = [];

    await _firestoreProvider
        .getSearchedUsers(
      collection: 'users',
      searchQuery: searchQuery,
    ).then(
      (QuerySnapshot<Map<String, dynamic>> value) {
        for (QueryDocumentSnapshot<Map<String, dynamic>> result in value.docs) {
          users.add(
            _userMapper.toModel(
              UserEntity.fromJson(
                result.data(),
              ),
            ),
          );
        }
      },
    );

    return users;
  }
}
