import 'user_model.dart';

class RegisterResponse {
  final String accessToken;
  final UserModel user;

  const RegisterResponse({
    required this.accessToken,
    required this.user,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      accessToken: json['access_token'] ?? '',
      user: UserModel.fromJson(json['user'] ?? {}),
    );
  }
}
