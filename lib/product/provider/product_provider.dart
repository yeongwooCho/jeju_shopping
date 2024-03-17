import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/product/model/product_model.dart';

final productProvider =
    StateNotifierProvider<ProductStateNotifier, List<ProductModel>>((ref) {
  return ProductStateNotifier();
});

class ProductStateNotifier extends StateNotifier<List<ProductModel>> {
  ProductStateNotifier()
      : super(
          [
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
            ProductModel(
              name: '곤드레만드레 나는 취해버렸어 너의 사랑에 취해벼렸ㅁㄴㅇ동해붐ㅇㄴㄹ',
              price: 24800,
              deliveryPrice: 3000,
              imageUrl: 'asset/img/product/product_1.jpg',
              category: Category.special,
            ),
          ],
        );
}
