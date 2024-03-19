import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
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
        id: DataUtils.getUuid(),
        name: '제주 신선 전복 1kg',
        price: 42210,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/0/main.jpg',
        detailImageUrls: [
          'asset/img/product/0/1.png',
          'asset/img/product/0/2.png',
          'asset/img/product/0/3.png',
          'asset/img/product/0/4.png',
        ],
        preferState: ProductPreferState.fresh,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '천혜향 혼합과 5kg',
        price: 46900,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/1/main.jpg',
        detailImageUrls: [
          'asset/img/product/1/1.png',
          'asset/img/product/1/2.png',
          'asset/img/product/1/3.png',
          'asset/img/product/1/4.png',
        ],
        preferState: ProductPreferState.fresh,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '자연산 생고사리 200g*4ea',
        price: 21900,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/2/main.jpg',
        detailImageUrls: [
          'asset/img/product/2/1.png',
          'asset/img/product/2/2.png',
          'asset/img/product/2/3.png',
          'asset/img/product/2/4.png',
        ],
        preferState: ProductPreferState.fresh,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '새콤달콤 한라봉 1kg',
        price: 14900,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/3/main.jpg',
        detailImageUrls: [
          'asset/img/product/3/1.png',
          'asset/img/product/3/2.png',
          'asset/img/product/3/3.png',
          'asset/img/product/3/4.png',
        ],
        preferState: ProductPreferState.fresh,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '영양소 풍부한 방울양배추 1팩 (500g)',
        price: 7500,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/4/main.jpg',
        detailImageUrls: [
          'asset/img/product/4/1.png',
          'asset/img/product/4/2.png',
          'asset/img/product/4/3.png',
          'asset/img/product/4/4.png',
        ],
        preferState: ProductPreferState.fresh,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '백돈/흑돈 뒷다리살 400g',
        price: 9800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/5/main.jpg',
        detailImageUrls: [
          'asset/img/product/5/1.png',
          'asset/img/product/5/2.png',
          'asset/img/product/5/3.png',
          'asset/img/product/5/4.png',
        ],
        preferState: ProductPreferState.fresh,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '새콤달콤 제주 청귤 2kg',
        price: 11500,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/6/main.jpg',
        detailImageUrls: [
          'asset/img/product/6/1.png',
          'asset/img/product/6/2.png',
          'asset/img/product/6/3.png',
          'asset/img/product/6/4.png',
        ],
        preferState: ProductPreferState.best,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '달콤하고 아삭한 제주 햇콜라비 5kg',
        price: 10200,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/7/main.jpg',
        detailImageUrls: [
          'asset/img/product/7/1.png',
          'asset/img/product/7/2.png',
          'asset/img/product/7/3.png',
          'asset/img/product/7/4.png',
        ],
        preferState: ProductPreferState.best,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '당도높은 무농약 세척당근 3kg',
        price: 13800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/8/main.jpg',
        detailImageUrls: [
          'asset/img/product/8/1.png',
          'asset/img/product/8/2.png',
          'asset/img/product/8/3.png',
          'asset/img/product/8/4.png',
        ],
        preferState: ProductPreferState.best,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '제주 달코미 과일 양배추 5kg',
        price: 12900,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/9/main.jpg',
        detailImageUrls: [
          'asset/img/product/9/1.png',
          'asset/img/product/9/2.png',
          'asset/img/product/9/3.png',
          'asset/img/product/9/4.png',
        ],
        preferState: ProductPreferState.best,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '수제 포기김치 5kg',
        price: 52000,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/10/main.jpg',
        detailImageUrls: [
          'asset/img/product/10/1.png',
          'asset/img/product/10/2.png',
          'asset/img/product/10/3.png',
          'asset/img/product/10/4.png',
        ],
        preferState: ProductPreferState.best,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '오메기떡/귤나와라뚝떡/크림치즈 쑥떡',
        price: 40800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/11/main.jpg',
        detailImageUrls: [
          'asset/img/product/11/1.png',
          'asset/img/product/11/2.png',
          'asset/img/product/11/3.png',
          'asset/img/product/11/4.png',
        ],
        preferState: ProductPreferState.best,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '알배기 암꽃게 1kg',
        price: 39900,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/12/main.jpg',
        detailImageUrls: [
          'asset/img/product/12/1.png',
          'asset/img/product/12/2.png',
          'asset/img/product/12/3.png',
          'asset/img/product/12/4.png',
        ],
        preferState: ProductPreferState.prefer,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '신선도A급 자숙 손질 스노우크랩',
        price: 42400,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/13/main.jpg',
        detailImageUrls: [
          'asset/img/product/13/1.png',
          'asset/img/product/13/2.png',
          'asset/img/product/13/3.png',
          'asset/img/product/13/4.png',
        ],
        preferState: ProductPreferState.prefer,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '자연산 프리미엄 특품 손질 새조개 500g',
        price: 31800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/14/main.jpg',
        detailImageUrls: [
          'asset/img/product/14/1.png',
          'asset/img/product/14/2.png',
          'asset/img/product/14/3.png',
          'asset/img/product/14/4.png',
        ],
        preferState: ProductPreferState.prefer,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '1등급 한돈 진짜 수제 돼지갈비 500g x 2팩',
        price: 63800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/15/main.jpg',
        detailImageUrls: [
          'asset/img/product/15/1.png',
          'asset/img/product/15/2.png',
          'asset/img/product/15/3.png',
          'asset/img/product/15/4.png',
        ],
        preferState: ProductPreferState.prefer,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '제주 수미감자 (상/대) 1.5kg',
        price: 14800,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/16/main.jpg',
        detailImageUrls: [
          'asset/img/product/16/1.png',
          'asset/img/product/16/2.png',
          'asset/img/product/16/3.png',
          'asset/img/product/16/4.png',
        ],
        preferState: ProductPreferState.prefer,
      ),
      ProductModel(
        id: DataUtils.getUuid(),
        name: '두 번 즐기는 제주 순살족발 290g',
        price: 9300,
        deliveryPrice: 3000,
        category: Category.special,
        isLike: false,
        mainImageUrl: 'asset/img/product/17/main.jpg',
        detailImageUrls: [
          'asset/img/product/17/1.png',
          'asset/img/product/17/2.png',
          'asset/img/product/17/3.png',
          'asset/img/product/17/4.png',
        ],
        preferState: ProductPreferState.prefer,
      ),
    ];
  }
}
