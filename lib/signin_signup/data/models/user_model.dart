class UserModel {
  final String id;
  final String name;
  final String email;
  final String? photoURL;

  UserModel(
      {required this.id,
      required this.name,
      required this.email,
      this.photoURL});

  factory UserModel.fromMap(Map<String, dynamic> data) {
    return UserModel(
        id: data['id'],
        name: data['name'],
        email: data['email'],
        photoURL: data['photoURL']);
  }
}
