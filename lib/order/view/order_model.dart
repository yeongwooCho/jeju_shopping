import 'package:jeju_shopping/product/model/product_model.dart';

enum Delivery {
  ready,
  doing,
  done,
}

class OrderModel {
  ProductModel productModel;
  Delivery deliveryState;
  int amount;

  OrderModel({
    required this.productModel,
    required this.deliveryState,
    required this.amount,
  });
}
