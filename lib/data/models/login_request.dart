class LoginRequest {
  final String emailOrPhone;
  final String password;

  const LoginRequest({
    required this.emailOrPhone,
    required this.password,
  });

  Map<String, dynamic> toJson() {
    return {
      'emailOrPhone': emailOrPhone,
      'password': password,
    };
  }
}
