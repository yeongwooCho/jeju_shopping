import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/order/view/order_model.dart';

final orderProvider =
    StateNotifierProvider<OrderStateNotifier, List<OrderModel>>((ref) {
  return OrderStateNotifier();
});

class OrderStateNotifier extends StateNotifier<List<OrderModel>> {
  OrderStateNotifier() : super([]);
}
