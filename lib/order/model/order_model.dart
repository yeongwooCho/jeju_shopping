import 'package:jeju_shopping/product/model/product_model.dart';

enum DeliveryState {
  no('주문중'),
  ready('준비중'),
  doing('배송중'),
  done('배송완료');

  const DeliveryState(this.label);

  final String label;
}

class OrderModel {
  final ProductModel productModel;
  final int amount;
  final DeliveryState deliveryState;
  final DateTime createdAt;

  OrderModel({
    required this.productModel,
    required this.amount,
    required this.deliveryState,
    required this.createdAt,
  });

  OrderModel copyWith({
    ProductModel? productModel,
    int? amount,
    DeliveryState? deliveryState,
    DateTime? createdAt,
  }) {
    return OrderModel(
      productModel: productModel ?? this.productModel,
      amount: amount ?? this.amount,
      deliveryState: deliveryState ?? this.deliveryState,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
