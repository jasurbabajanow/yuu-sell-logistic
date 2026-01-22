import 'package:dio/dio.dart';

class ApiException implements Exception {
  final String message;
  final int? statusCode;
  final dynamic data;

  ApiException({
    required this.message,
    this.statusCode,
    this.data,
  });

  factory ApiException.fromDioException(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return ApiException(
          message: 'Connection timeout. Please check your internet connection.',
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.connectionError:
        return ApiException(
          message: 'No internet connection. Please check your network.',
          statusCode: error.response?.statusCode,
        );
      case DioExceptionType.badResponse:
        return _handleBadResponse(error.response);
      case DioExceptionType.cancel:
        return ApiException(
          message: 'Request was cancelled.',
          statusCode: error.response?.statusCode,
        );
      default:
        return ApiException(
          message: 'Something went wrong. Please try again.',
          statusCode: error.response?.statusCode,
        );
    }
  }

  static ApiException _handleBadResponse(Response? response) {
    final statusCode = response?.statusCode;
    final data = response?.data;

    String message = 'Something went wrong';

    if (data is Map<String, dynamic>) {
      message = data['message'] ?? data['error'] ?? message;
    }

    switch (statusCode) {
      case 400:
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
        );
      case 401:
        return ApiException(
          message: 'Unauthorized. Please login again.',
          statusCode: statusCode,
          data: data,
        );
      case 403:
        return ApiException(
          message: 'Access denied.',
          statusCode: statusCode,
          data: data,
        );
      case 404:
        return ApiException(
          message: 'Resource not found.',
          statusCode: statusCode,
          data: data,
        );
      case 422:
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
        );
      case 500:
        return ApiException(
          message: 'Server error. Please try again later.',
          statusCode: statusCode,
          data: data,
        );
      default:
        return ApiException(
          message: message,
          statusCode: statusCode,
          data: data,
        );
    }
  }

  @override
  String toString() => message;
}
