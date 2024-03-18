import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/cart/model/cart_model.dart';
import 'package:jeju_shopping/order/model/order_model.dart';
import 'package:jeju_shopping/product/model/product_model.dart';

final orderProvider =
    StateNotifierProvider<OrderStateNotifier, List<OrderModel>>((ref) {
  return OrderStateNotifier();
});

class OrderStateNotifier extends StateNotifier<List<OrderModel>> {
  OrderStateNotifier()
      : super([
          // OrderModel(
          //   productModel: productModel,
          //   amount: amount,
          //   deliveryState: deliveryState,
          //   createdAt: createdAt,
          // ),
        ]);

  void addProductRightNow({
    required ProductModel productModel,
    required int amount,
  }) {
    state = [
      OrderModel(
        productModel: productModel,
        amount: amount,
        deliveryState: DeliveryState.no,
        createdAt: DateTime.now(),
      ),
    ];
  }

  void addProductsFromCarts({
    required List<CartModel> carts,
  }) {
    state = [
      ...carts
          .map((e) => OrderModel(
                productModel: e.productModel,
                amount: e.amount,
                deliveryState: DeliveryState.no,
                createdAt: DateTime.now(),
              ))
          .toList()
    ];
  }
}
