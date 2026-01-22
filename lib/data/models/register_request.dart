class RegisterRequest {
  final String email;
  final String phone;
  final String password;
  final String firstName;
  final String lastName;
  final String role;

  const RegisterRequest({
    required this.email,
    required this.phone,
    required this.password,
    this.firstName = '',
    this.lastName = '',
    this.role = '',
  });

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'phone': phone,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'role': role,
    };
  }
}
