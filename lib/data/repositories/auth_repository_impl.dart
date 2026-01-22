import '../../core/errors/api_exception.dart';
import '../../core/errors/result.dart';
import '../../core/network/dio_client.dart';
import '../../domain/entities/user_entity.dart';
import '../../domain/repositories/auth_repository.dart';
import '../datasources/remote/auth_remote_datasource.dart';
import '../models/register_request.dart';
import '../models/register_response.dart';
import '../models/login_request.dart';
import '../models/login_response.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource _remoteDataSource;
  final DioClient _dioClient;

  AuthRepositoryImpl(this._remoteDataSource, this._dioClient);

  @override
  Future<Result<UserEntity>> register(RegisterRequest request) async {
    try {
      final response = await _remoteDataSource.register(request);
      final registerResponse = RegisterResponse.fromJson(response);

      _dioClient.setTokens(accessToken: registerResponse.accessToken);

      return Success(registerResponse.user);
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<UserEntity>> login(LoginRequest request) async {
    try {
      final response = await _remoteDataSource.login(request);
      final loginResponse = LoginResponse.fromJson(response);

      _dioClient.setTokens(accessToken: loginResponse.accessToken);

      return Success(loginResponse.user);
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
