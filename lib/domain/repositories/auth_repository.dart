import '../../core/errors/result.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<String>> register({
    required String phone,
    required String name,
  });

  Future<Result<UserEntity>> verifyOtp({
    required String phone,
    required String otp,
  });

  Future<Result<UserEntity>> login({
    required String phone,
    required String password,
  });

  Future<Result<void>> logout();
}
