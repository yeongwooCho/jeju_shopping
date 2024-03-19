enum Category {
  special('특산품'),
  agricultural('농산물'),
  sea('수산물'),
  livestock('축산물'),
  healthy('건강식'),
  convenience('간편식');

  const Category(this.label);

  final String label;
}

enum ProductPreferState {
  fresh('신선하고 깔끔한 프레시 상품'),
  best('가장 많이 판매된 베스트 상품'),
  prefer('고객님 맞춤 추천 상품');

  const ProductPreferState(this.label);

  final String label;
}

class ProductModel {
  final String id;
  final String name;
  final int price;
  final int deliveryPrice;
  final bool isLike;
  final List<String> category;
  final ProductPreferState preferState;
  final String mainImageUrl;
  final List<String> detailImageUrls;
  final bool isIngredient;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.deliveryPrice,
    required this.isLike,
    required this.category,
    required this.preferState,
    required this.mainImageUrl,
    required this.detailImageUrls,
    this.isIngredient = false,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    int? price,
    int? deliveryPrice,
    String? imageUrl,
    bool? isLike,
    List<String>? category,
    ProductPreferState? preferState,
    String? mainImageUrl,
    List<String>? detailImageUrls,
    bool? isIngredient,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      preferState: preferState ?? this.preferState,
      isLike: isLike ?? this.isLike,
      category: category ?? this.category,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
      isIngredient: isIngredient ?? this.isIngredient,
    );
  }
}
