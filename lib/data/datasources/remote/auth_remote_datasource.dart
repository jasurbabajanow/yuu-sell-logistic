import 'package:dio/dio.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/errors/api_exception.dart';
import '../../models/register_request.dart';
import '../../models/login_request.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> register(RegisterRequest request);
  Future<Map<String, dynamic>> login(LoginRequest request);
  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<Map<String, dynamic>> register(RegisterRequest request) async {
    try {
      final response = await _client.post(
        ApiConstants.register,
        data: request.toJson(),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> login(LoginRequest request) async {
    try {
      final response = await _client.post(
        ApiConstants.login,
        data: request.toJson(),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<void> logout() async {
    try {
      await _client.post(ApiConstants.logout);
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
