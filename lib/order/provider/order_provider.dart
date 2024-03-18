import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/cart/model/cart_model.dart';
import 'package:jeju_shopping/order/model/order_model.dart';
import 'package:jeju_shopping/product/model/product_model.dart';

final orderProvider =
    StateNotifierProvider<OrderStateNotifier, List<OrderModel>>((ref) {
  return OrderStateNotifier(orders: []);
});

class OrderStateNotifier extends StateNotifier<List<OrderModel>> {
  OrderStateNotifier({
    required List<OrderModel> orders,
  }) : super([
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
    final now = DateTime.now();
    state = [
      OrderModel(
        productModel: productModel,
        amount: amount,
        deliveryState: DeliveryState.no,
        createdAt: DateTime(now.year, now.month, now.day),
      ),
    ];
  }

  void addProductsFromCarts({
    required List<CartModel> carts,
  }) {
    final now = DateTime.now();
    state = [
      ...carts
          .map((e) => OrderModel(
                productModel: e.productModel,
                amount: e.amount,
                deliveryState: DeliveryState.no,
                createdAt: DateTime(now.year, now.month, now.day),
              ))
          .toList()
    ];
  }

  void orderProducts() {
    state = [
      ...state
          .map((e) => e.copyWith(
                deliveryState: DeliveryState.ready,
              ))
          .toList()
    ];
  }
}
