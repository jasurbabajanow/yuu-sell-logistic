import 'package:flutter/material.dart';
import '../../core/errors/result.dart';
import '../../data/models/create_order_request.dart';
import '../../data/models/order_item_model.dart';
import '../../data/models/orders_response.dart';
import '../../domain/entities/order_entity.dart';
import '../../domain/repositories/order_repository.dart';

enum OrderStatus {
  initial,
  loading,
  loaded,
  creating,
  created,
  error,
}

class OrderProvider extends ChangeNotifier {
  final OrderRepository _orderRepository;

  OrderProvider(this._orderRepository);

  OrderStatus _status = OrderStatus.initial;
  List<OrderEntity> _orders = [];
  OrderEntity? _selectedOrder;
  OrderEntity? _createdOrder;
  PaginationMeta? _paginationMeta;
  String? _errorMessage;

  OrderStatus get status => _status;
  List<OrderEntity> get orders => _orders;
  OrderEntity? get selectedOrder => _selectedOrder;
  OrderEntity? get createdOrder => _createdOrder;
  PaginationMeta? get paginationMeta => _paginationMeta;
  String? get errorMessage => _errorMessage;
  bool get isLoading => _status == OrderStatus.loading;
  bool get isCreating => _status == OrderStatus.creating;
  bool get hasMore =>
      _paginationMeta != null &&
      _paginationMeta!.page < _paginationMeta!.totalPages;

  void _setLoading() {
    _status = OrderStatus.loading;
    _errorMessage = null;
    notifyListeners();
  }

  void _setCreating() {
    _status = OrderStatus.creating;
    _errorMessage = null;
    notifyListeners();
  }

  void _setError(String message) {
    _status = OrderStatus.error;
    _errorMessage = message;
    notifyListeners();
  }

  void _setLoaded() {
    _status = OrderStatus.loaded;
    _errorMessage = null;
    notifyListeners();
  }

  void _setCreated(OrderEntity order) {
    _status = OrderStatus.created;
    _createdOrder = order;
    _errorMessage = null;
    notifyListeners();
  }

  void clearError() {
    _errorMessage = null;
    notifyListeners();
  }

  void clearCreatedOrder() {
    _createdOrder = null;
    if (_status == OrderStatus.created) {
      _status = OrderStatus.loaded;
    }
    notifyListeners();
  }

  Future<bool> fetchOrders({int page = 1, int limit = 20}) async {
    _setLoading();

    final result = await _orderRepository.getOrders(page: page, limit: limit);

    return result.when(
      success: (response) {
        if (page == 1) {
          _orders = response.data;
        } else {
          _orders = [..._orders, ...response.data];
        }
        _paginationMeta = response.meta;
        _setLoaded();
        return true;
      },
      failure: (message, statusCode) {
        _setError(message);
        return false;
      },
    );
  }

  Future<bool> loadMoreOrders() async {
    if (!hasMore || isLoading) return false;

    final nextPage = (_paginationMeta?.page ?? 0) + 1;
    return fetchOrders(page: nextPage, limit: _paginationMeta?.limit ?? 20);
  }

  Future<bool> refreshOrders() async {
    return fetchOrders(page: 1, limit: _paginationMeta?.limit ?? 20);
  }

  Future<bool> fetchOrderById(int id) async {
    _setLoading();

    final result = await _orderRepository.getOrderById(id);

    return result.when(
      success: (order) {
        _selectedOrder = order;
        _setLoaded();
        return true;
      },
      failure: (message, statusCode) {
        _setError(message);
        return false;
      },
    );
  }

  Future<bool> createOrder({
    required List<OrderItemModel> items,
    required int clientId,
    required String originPoint,
    required String destinationPoint,
    required String cargoType,
    required double weight,
    required double volume,
    required double deliveryCost,
    String status = 'created',
    DateTime? deliveryWindowStart,
    DateTime? deliveryWindowEnd,
    int? warehouseId,
  }) async {
    _setCreating();

    final request = CreateOrderRequest(
      items: items,
      clientId: clientId,
      originPoint: originPoint,
      destinationPoint: destinationPoint,
      cargoType: cargoType,
      weight: weight,
      volume: volume,
      status: status,
      deliveryCost: deliveryCost,
      deliveryWindowStart: deliveryWindowStart,
      deliveryWindowEnd: deliveryWindowEnd,
      warehouseId: warehouseId,
    );

    final result = await _orderRepository.createOrder(request);

    return result.when(
      success: (order) {
        _setCreated(order);
        // Add the new order to the beginning of the list
        _orders = [order, ..._orders];
        return true;
      },
      failure: (message, statusCode) {
        _setError(message);
        return false;
      },
    );
  }

  void selectOrder(OrderEntity order) {
    _selectedOrder = order;
    notifyListeners();
  }

  void clearSelectedOrder() {
    _selectedOrder = null;
    notifyListeners();
  }
}
