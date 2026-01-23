import 'client_entity.dart';
import 'order_item_entity.dart';

class OrderEntity {
  final int id;
  final int clientId;
  final String originPoint;
  final String destinationPoint;
  final String cargoType;
  final double weight;
  final double volume;
  final String status;
  final double deliveryCost;
  final DateTime? deliveryWindowStart;
  final DateTime? deliveryWindowEnd;
  final int? warehouseId;
  final int? shipmentId;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final DateTime? deliveryDate;
  final ClientEntity? client;
  final List<OrderItemEntity> items;

  const OrderEntity({
    required this.id,
    required this.clientId,
    required this.originPoint,
    required this.destinationPoint,
    required this.cargoType,
    required this.weight,
    required this.volume,
    required this.status,
    required this.deliveryCost,
    this.deliveryWindowStart,
    this.deliveryWindowEnd,
    this.warehouseId,
    this.shipmentId,
    this.createdAt,
    this.updatedAt,
    this.deliveryDate,
    this.client,
    this.items = const [],
  });
}
