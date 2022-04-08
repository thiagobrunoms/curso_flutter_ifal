class UserEntity {
  String id;
  String name;
  String email;
  String? photoURL;

  UserEntity(
      {required this.id,
      required this.name,
      required this.email,
      this.photoURL});

  @override
  String toString() =>
      '[id = $id, name = $name, email = $email, photoURL: $photoURL';
}
