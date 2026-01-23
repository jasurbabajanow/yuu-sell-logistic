import 'order_model.dart';

class PaginationMeta {
  final int total;
  final int page;
  final int limit;
  final int totalPages;

  const PaginationMeta({
    required this.total,
    required this.page,
    required this.limit,
    required this.totalPages,
  });

  factory PaginationMeta.fromJson(Map<String, dynamic> json) {
    return PaginationMeta(
      total: json['total'] ?? 0,
      page: json['page'] ?? 1,
      limit: json['limit'] ?? 20,
      totalPages: json['totalPages'] ?? 1,
    );
  }
}

class OrdersResponse {
  final List<OrderModel> data;
  final PaginationMeta meta;

  const OrdersResponse({
    required this.data,
    required this.meta,
  });

  factory OrdersResponse.fromJson(Map<String, dynamic> json) {
    return OrdersResponse(
      data: json['data'] != null
          ? (json['data'] as List)
              .map((order) => OrderModel.fromJson(order))
              .toList()
          : [],
      meta: PaginationMeta.fromJson(json['meta'] ?? {}),
    );
  }
}
