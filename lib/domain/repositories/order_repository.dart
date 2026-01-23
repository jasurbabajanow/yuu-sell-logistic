import '../../core/errors/result.dart';
import '../../data/models/create_order_request.dart';
import '../../data/models/orders_response.dart';
import '../entities/order_entity.dart';

abstract class OrderRepository {
  Future<Result<OrdersResponse>> getOrders({int? page, int? limit});
  Future<Result<OrderEntity>> getOrderById(int id);
  Future<Result<OrderEntity>> createOrder(CreateOrderRequest request);
}
