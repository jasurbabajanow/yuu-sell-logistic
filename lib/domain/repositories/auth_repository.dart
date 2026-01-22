import '../../core/errors/result.dart';
import '../../data/models/register_request.dart';
import '../../data/models/login_request.dart';
import '../entities/user_entity.dart';

abstract class AuthRepository {
  Future<Result<UserEntity>> register(RegisterRequest request);
  Future<Result<UserEntity>> login(LoginRequest request);
  Future<Result<void>> logout();
}
