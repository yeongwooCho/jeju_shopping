import 'package:jeju_shopping/product/model/product_model.dart';

enum CookState {
  breakfast('아침'),
  lunch('점심'),
  dinner('저녁');

  const CookState(this.label);

  final String label;
}

class RecipeModel {
  final String imageUrl;
  final String description;

  RecipeModel({
    required this.imageUrl,
    required this.description,
  });
}

class CookModel {
  final String id;
  final String name;
  final String description;
  final Map<String, String> ingredient;
  final List<RecipeModel> recipe;
  final CookState cookState;
  final String mainImageUrl;
  final List<String> detailImageUrls;
  final List<ProductModel> preferProducts;

  CookModel({
    required this.id,
    required this.name,
    required this.description,
    required this.ingredient,
    required this.recipe,
    required this.cookState,
    required this.mainImageUrl,
    required this.detailImageUrls,
    required this.preferProducts,
  });

  CookModel copyWith({
    String? id,
    String? name,
    String? description,
    Map<String, String>? ingredient,
    List<RecipeModel>? recipe,
    CookState? cookState,
    String? mainImageUrl,
    List<String>? detailImageUrls,
    List<ProductModel>? preferProducts,
  }) {
    return CookModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredient: ingredient ?? this.ingredient,
      recipe: recipe ?? this.recipe,
      cookState: cookState ?? this.cookState,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      detailImageUrls: detailImageUrls ?? this.detailImageUrls,
      preferProducts: preferProducts ?? this.preferProducts,
    );
  }
}
