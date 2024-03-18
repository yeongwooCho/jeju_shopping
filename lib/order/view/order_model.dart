import 'package:jeju_shopping/product/model/product_model.dart';

enum Delivery {
  ready,
  doing,
  done,
}

class OrderModel {
  final ProductModel productModel;
  final Delivery deliveryState;
  final int amount;
  final DateTime createdAt;

  OrderModel({
    required this.productModel,
    required this.deliveryState,
    required this.amount,
    required this.createdAt,
  });
}
