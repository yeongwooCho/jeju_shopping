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

class ProductModel {
  final String id;
  final String name;
  final int price;
  final int deliveryPrice;
  final bool isLike;
  final Category category;
  final String mainImageUrl;
  final List<String> detailImageUrls;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.deliveryPrice,
    required this.isLike,
    required this.category,
    required this.mainImageUrl,
    required this.detailImageUrls,
  });

  ProductModel copyWith({
    String? id,
    String? name,
    int? price,
    int? deliveryPrice,
    String? imageUrl,
    bool? isLike,
    Category? category,
    String? mainImageUrl,
    List<String>? detailImageUrls,
  }) {
    return ProductModel(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      deliveryPrice: deliveryPrice ?? this.deliveryPrice,
      isLike: isLike ?? this.isLike,
      category: category ?? this.category,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
    );
  }
}
