class UserModel {
  final String email;
  final String uid;
  final bool isAdmin;
  final bool isSuperAdmin;

  const UserModel({
    required this.email,
    required this.uid,
    required this.isAdmin,
    required this.isSuperAdmin,
  });

  UserModel copyWith({
    String? email,
    String? uid,
    bool? isAdmin,
    bool? isSuperAdmin,
  }) =>
      UserModel(
        email: email ?? this.email,
        uid: uid ?? this.uid,
        isAdmin: isAdmin ?? this.isAdmin,
        isSuperAdmin: isSuperAdmin ?? this.isSuperAdmin,
      );

  UserModel.empty()
      : email = '',
        uid = '',
        isAdmin = false,
        isSuperAdmin = false;
}
