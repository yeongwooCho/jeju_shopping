import 'package:jeju_shopping/product/model/product_model.dart';

class DeliveryModel {
  final ProductModel productModel;
  final int amount;
  final bool isSelected;

  DeliveryModel({
    required this.productModel,
    required this.amount,
    required this.isSelected,
  });
}
