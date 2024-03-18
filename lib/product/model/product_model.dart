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
  final int id;
  final String name;
  final int price;
  final int deliveryPrice;
  final String imageUrl;
  final Category category;

  ProductModel({
    required this.id,
    required this.name,
    required this.price,
    required this.deliveryPrice,
    required this.imageUrl,
    required this.category,
  });
}
