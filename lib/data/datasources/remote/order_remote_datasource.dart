import 'package:dio/dio.dart';
import '../../../core/network/api_constants.dart';
import '../../../core/network/dio_client.dart';
import '../../../core/errors/api_exception.dart';
import '../../models/create_order_request.dart';

abstract class OrderRemoteDataSource {
  Future<Map<String, dynamic>> getOrders({int? page, int? limit});
  Future<Map<String, dynamic>> getOrderById(int id);
  Future<Map<String, dynamic>> createOrder(CreateOrderRequest request);
}

class OrderRemoteDataSourceImpl implements OrderRemoteDataSource {
  final DioClient _client;

  OrderRemoteDataSourceImpl(this._client);

  @override
  Future<Map<String, dynamic>> getOrders({int? page, int? limit}) async {
    try {
      final queryParams = <String, dynamic>{};
      if (page != null) queryParams['page'] = page;
      if (limit != null) queryParams['limit'] = limit;

      final response = await _client.get(
        ApiConstants.orders,
        queryParameters: queryParams.isNotEmpty ? queryParams : null,
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> getOrderById(int id) async {
    try {
      final response = await _client.get('${ApiConstants.orders}/$id');
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> createOrder(CreateOrderRequest request) async {
    try {
      final response = await _client.post(
        ApiConstants.orders,
        data: request.toJson(),
      );
      return response.data as Map<String, dynamic>;
    } on DioException catch (e) {
      throw ApiException.fromDioException(e);
    }
  }
}
