class OrderItemEntity {
  final int? id;
  final int? orderId;
  final String type;
  final String? description;
  final int qty;
  final double weightKg;
  final double volumeM3;
  final double lengthCm;
  final double widthCm;
  final double heightCm;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const OrderItemEntity({
    this.id,
    this.orderId,
    required this.type,
    this.description,
    required this.qty,
    required this.weightKg,
    required this.volumeM3,
    required this.lengthCm,
    required this.widthCm,
    required this.heightCm,
    this.createdAt,
    this.updatedAt,
  });
}
