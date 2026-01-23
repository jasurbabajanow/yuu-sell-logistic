import '../../core/errors/api_exception.dart';
import '../../core/errors/result.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';
import '../datasources/remote/order_remote_datasource.dart';
import '../models/create_order_request.dart';
import '../models/order_model.dart';
import '../models/orders_response.dart';

class OrderRepositoryImpl implements OrderRepository {
  final OrderRemoteDataSource _remoteDataSource;

  OrderRepositoryImpl(this._remoteDataSource);

  @override
  Future<Result<OrdersResponse>> getOrders({int? page, int? limit}) async {
    try {
      final response = await _remoteDataSource.getOrders(
        page: page,
        limit: limit,
      );
      final ordersResponse = OrdersResponse.fromJson(response);
      return Success(ordersResponse);
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<OrderEntity>> getOrderById(int id) async {
    try {
      final response = await _remoteDataSource.getOrderById(id);
      final order = OrderModel.fromJson(response);
      return Success(order);
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }

  @override
  Future<Result<OrderEntity>> createOrder(CreateOrderRequest request) async {
    try {
      final response = await _remoteDataSource.createOrder(request);
      final order = OrderModel.fromJson(response);
      return Success(order);
    } on ApiException catch (e) {
      return Failure(e.message, statusCode: e.statusCode);
    } catch (e) {
      return Failure(e.toString());
    }
  }
}
