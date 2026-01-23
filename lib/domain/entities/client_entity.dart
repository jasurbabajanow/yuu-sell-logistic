class ClientEntity {
  final int id;
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String country;
  final String address;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const ClientEntity({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.phone,
    required this.country,
    required this.address,
    this.createdAt,
    this.updatedAt,
  });

  String get fullName => '$firstName $lastName'.trim();
}
