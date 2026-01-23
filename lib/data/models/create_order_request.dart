import 'order_item_model.dart';

class CreateOrderRequest {
  final List<OrderItemModel> items;
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

  const CreateOrderRequest({
    required this.items,
    required this.clientId,
    required this.originPoint,
    required this.destinationPoint,
    required this.cargoType,
    required this.weight,
    required this.volume,
    this.status = 'created',
    required this.deliveryCost,
    this.deliveryWindowStart,
    this.deliveryWindowEnd,
    this.warehouseId,
  });

  Map<String, dynamic> toJson() {
    return {
      'items': items.map((item) => item.toJson()).toList(),
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
    };
  }
}
