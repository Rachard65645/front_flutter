class OrdersModel {
  final String storeId;
  final String gasBottle_id;
  final num quantity;
  final String aggregator_method_id;

  OrdersModel(
      {
      required this.storeId,
      required this.gasBottle_id,
      required this.quantity,
      required this.aggregator_method_id});

  factory OrdersModel.fromJson(Map<String, dynamic> json) {
    return OrdersModel(
        storeId: json['storeId'],
        gasBottle_id: json['gasBottle_id'],
        quantity: json['quantity'],
        aggregator_method_id: json['aggregator_method_id']);
  }

  Map<String, dynamic> toJson() {
    return {
      'storeId': storeId,
      'gasBottle_id': gasBottle_id,
      'quantity': quantity,
      'aggregator_method_id': aggregator_method_id,
    };
  }
}
