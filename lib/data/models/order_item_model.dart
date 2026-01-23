import '../../domain/entities/order_item_entity.dart';

class OrderItemModel extends OrderItemEntity {
  const OrderItemModel({
    super.id,
    super.orderId,
    required super.type,
    super.description,
    required super.qty,
    required super.weightKg,
    required super.volumeM3,
    required super.lengthCm,
    required super.widthCm,
    required super.heightCm,
    super.createdAt,
    super.updatedAt,
  });

  factory OrderItemModel.fromJson(Map<String, dynamic> json) {
    return OrderItemModel(
      id: json['id'],
      orderId: json['orderId'],
      type: json['type'] ?? 'general',
      description: json['description'],
      qty: json['qty'] ?? 1,
      weightKg: _parseDouble(json['weightKg']),
      volumeM3: _parseDouble(json['volumeM3']),
      lengthCm: _parseDouble(json['lengthCm']),
      widthCm: _parseDouble(json['widthCm']),
      heightCm: _parseDouble(json['heightCm']),
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      if (id != null) 'id': id,
      if (orderId != null) 'orderId': orderId,
      'type': type,
      if (description != null) 'description': description,
      'qty': qty,
      'weightKg': weightKg,
      'volumeM3': volumeM3,
      'lengthCm': lengthCm,
      'widthCm': widthCm,
      'heightCm': heightCm,
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
