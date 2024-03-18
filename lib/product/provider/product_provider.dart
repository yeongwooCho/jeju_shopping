import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/product/model/product_model.dart';

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier() : super([]) {
    state = getItems();
  }

  void updateLike({
    required String productId,
    required bool isLike,
  }) {
    state = state.map((element) {
      if (element.id == productId) {
        return element.copyWith(isLike: isLike);
      } else {
        return element;
      }
    }).toList();
  }

  List<ProductModel> getItems() {
    return [
      ProductModel(
        id: '0',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '1',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '2',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '3',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '4',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '5',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '6',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '7',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '8',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '9',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
      ProductModel(
        id: '10',
        name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
        price: 24800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/product_1.jpg',
        detailImageUrls: [],
      ),
    ];
  }
}
