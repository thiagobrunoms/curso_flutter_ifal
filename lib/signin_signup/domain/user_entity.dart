class UserEntity {
  String id;
  String name;
  String email;

  UserEntity({required this.id, required this.name, required this.email});

  factory UserEntity.fromMap(Map<String, dynamic> data) {
    return UserEntity(id: data['id'], name: data['name'], email: data['email']);
  }

  @override
  String toString() => '[id = $id, name = $name';
}
