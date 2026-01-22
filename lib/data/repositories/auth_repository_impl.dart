import '../../core/errors/api_exception.dart';
import '../../core/errors/result.dart';
import '../../core/network/dio_client.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';
import '../models/user_model.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final DioClient _dioClient;

  AuthRepositoryImpl(this._remoteDataSource, this._dioClient);

  @override
  Future<Result<String>> register({
    required String phone,
    required String name,
  }) async {
    try {
      final response = await _remoteDataSource.register(
        phone: phone,
        name: name,
      );
      final message = response['message'] as String? ?? 'OTP sent successfully';
      return Success(message);
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<UserEntity>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _remoteDataSource.verifyOtp(
        phone: phone,
        otp: otp,
      );

      final accessToken = response['access_token'] as String?;
      final refreshToken = response['refresh_token'] as String?;

      if (accessToken != null) {
        _dioClient.setTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      }

      final userData = response['user'] as Map<String, dynamic>?;
      if (userData != null) {
        return Success(UserModel.fromJson(userData));
      }

      return const Failure('Invalid response from server');
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<UserEntity>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _remoteDataSource.login(
        phone: phone,
        password: password,
      );

      final accessToken = response['access_token'] as String?;
      final refreshToken = response['refresh_token'] as String?;

      if (accessToken != null) {
        _dioClient.setTokens(
          accessToken: accessToken,
          refreshToken: refreshToken,
        );
      }

      final userData = response['user'] as Map<String, dynamic>?;
      if (userData != null) {
        return Success(UserModel.fromJson(userData));
      }

      return const Failure('Invalid response from server');
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<void>> logout() async {
    try {
      await _remoteDataSource.logout();
      _dioClient.clearTokens();
      return const Success(null);
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
