import '../../domain/entities/order_entity.dart';
import 'client_model.dart';
import 'order_item_model.dart';

class OrderModel extends OrderEntity {
  const OrderModel({
    required super.id,
    required super.clientId,
    required super.originPoint,
    required super.destinationPoint,
    required super.cargoType,
    required super.weight,
    required super.volume,
    required super.status,
    required super.deliveryCost,
    super.deliveryWindowStart,
    super.deliveryWindowEnd,
    super.warehouseId,
    super.shipmentId,
    super.createdAt,
    super.updatedAt,
    super.deliveryDate,
    super.client,
    super.items = const [],
  });

  factory OrderModel.fromJson(Map<String, dynamic> json) {
    return OrderModel(
      id: json['id'] ?? 0,
      clientId: json['clientId'] ?? 0,
      originPoint: json['originPoint'] ?? '',
      destinationPoint: json['destinationPoint'] ?? '',
      cargoType: json['cargoType'] ?? 'general',
      weight: _parseDouble(json['weight']),
      volume: _parseDouble(json['volume']),
      status: json['status'] ?? 'created',
      deliveryCost: _parseDouble(json['deliveryCost']),
      deliveryWindowStart: json['deliveryWindowStart'] != null
          ? DateTime.tryParse(json['deliveryWindowStart'])
          : null,
      deliveryWindowEnd: json['deliveryWindowEnd'] != null
          ? DateTime.tryParse(json['deliveryWindowEnd'])
          : null,
      warehouseId: json['warehouseId'],
      shipmentId: json['shipmentId'],
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
      deliveryDate: json['deliveryDate'] != null
          ? DateTime.tryParse(json['deliveryDate'])
          : null,
      client: json['client'] != null
          ? ClientModel.fromJson(json['client'])
          : null,
      items: json['items'] != null
          ? (json['items'] as List)
              .map((item) => OrderItemModel.fromJson(item))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'clientId': clientId,
      'originPoint': originPoint,
      'destinationPoint': destinationPoint,
      'cargoType': cargoType,
      'weight': weight,
      'volume': volume,
      'status': status,
      'deliveryCost': deliveryCost,
      if (deliveryWindowStart != null)
        'deliveryWindowStart': deliveryWindowStart!.toIso8601String(),
      if (deliveryWindowEnd != null)
        'deliveryWindowEnd': deliveryWindowEnd!.toIso8601String(),
      if (warehouseId != null) 'warehouseId': warehouseId,
      if (shipmentId != null) 'shipmentId': shipmentId,
    };
  }

  static double _parseDouble(dynamic value) {
    if (value == null) return 0.0;
    if (value is double) return value;
    if (value is int) return value.toDouble();
    if (value is String) return double.tryParse(value) ?? 0.0;
    return 0.0;
  }
}
