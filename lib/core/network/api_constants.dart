class ApiConstants {
  ApiConstants._();

  static const String baseUrl = 'https://api.example.com/api/v1';

  static const Duration connectTimeout = Duration(seconds: 30);
  static const Duration receiveTimeout = Duration(seconds: 30);

  // Auth endpoints
  static const String register = '/auth/register';
  static const String login = '/auth/login';
  static const String verifyOtp = '/auth/verify-otp';
  static const String resendOtp = '/auth/resend-otp';
  static const String refreshToken = '/auth/refresh-token';
  static const String logout = '/auth/logout';

  // User endpoints
  static const String profile = '/user/profile';
  static const String updateProfile = '/user/update';
}
