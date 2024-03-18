import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/cart/model/cart_model.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:uuid/uuid.dart';

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
    final uuid = Uuid();
    final id = uuid.v4();

    state = [
      ...state,
      CartModel(
        id: id,
        productModel: product,
        amount: amount,
        isSelected: true,
      ),
    ];
  }

  void updateSelected({
    required String cartId,
    required bool isSelected,
  }) {
    state = state.map<CartModel>((e) {
      if (e.id == cartId) {
        return e.copyWith(isSelected: isSelected);
      }
      return e;
    }).toList();
  }

  void updateAllSelected({
    required bool isSelected,
  }) {
    state = state.map<CartModel>((e) {
      return e.copyWith(isSelected: isSelected);
    }).toList();
  }

  void removeProduct({
    required String id,
  }) {
    state = state.where((element) => element.id != id).toList();
  }

  void removeAllSelectedProduct() {
    state = state.where((element) => !element.isSelected).toList();
  }

  void updateAmount({
    required String cartId,
    required int amount,
  }) {
    state = state.map<CartModel>((e) {
      if (e.id == cartId) {
        return e.copyWith(amount: amount);
      }
      return e;
    }).toList();
  }
}
