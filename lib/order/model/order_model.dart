import 'package:jeju_shopping/product/model/product_model.dart';

enum Delivery {
  ready,
  doing,
  done,
}

class OrderModel {
  final ProductModel productModel;
  final int amount;
  final Delivery deliveryState;
  final DateTime createdAt;

  OrderModel({
    required this.productModel,
    required this.amount,
    required this.deliveryState,
    required this.createdAt,
  });
}
