import 'package:dio/dio.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/errors/api_exception.dart';

abstract class AuthRemoteDataSource {
  Future<Map<String, dynamic>> register({
    required String phone,
    required String name,
  });

  Future<Map<String, dynamic>> verifyOtp({
    required String phone,
    required String otp,
  });

  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  });

  Future<void> logout();
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final DioClient _client;

  AuthRemoteDataSourceImpl(this._client);

  @override
  Future<Map<String, dynamic>> register({
    required String phone,
    required String name,
  }) async {
    try {
      final response = await _client.post(
        ApiConstants.register,
        data: {
          'phone': phone,
          'name': name,
        },
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final response = await _client.post(
        ApiConstants.verifyOtp,
        data: {
          'phone': phone,
          'otp': otp,
        },
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> login({
    required String phone,
    required String password,
  }) async {
    try {
      final response = await _client.post(
        ApiConstants.login,
        data: {
          'phone': phone,
          'password': password,
        },
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
