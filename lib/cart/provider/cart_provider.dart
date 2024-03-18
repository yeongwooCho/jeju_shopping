import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/cart/model/cart_model.dart';
import 'package:jeju_shopping/product/model/product_model.dart';

final cartProvider =
    StateNotifierProvider<CartStateNotifier, List<CartModel>>((ref) {
  return CartStateNotifier();
});

class CartStateNotifier extends StateNotifier<List<CartModel>> {
  CartStateNotifier() : super([]);

  void addProduct({
    required ProductModel product,
    required int amount,
  }) {
    state = [
      ...state,
      CartModel(
        id: '',
        productModel: product,
        amount: amount,
        isSelected: true,
      ),
    ];
  }

  void updateSelected({
    required String id,
    required bool isSelected,
  }) {
    state = state.map<CartModel>((e) {
      if (e.id == id) {
        e.copyWith(isSelected: isSelected);
      }
      return e;
    }).toList();
  }
}
