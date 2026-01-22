class UserEntity {
  final String id;
  final String firstName;
  final String lastName;
  final String phone;
  final String email;
  final String role;

  const UserEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.role,
  });

  String get fullName => '$firstName $lastName'.trim();
}
