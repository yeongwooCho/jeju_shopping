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

class IngredientModel {
  final String title;
  final String description;

  IngredientModel({
    required this.title,
    required this.description,
  });
}

class CookModel {
  final String id;
  final String mainImageUrl;
  final String name;
  final String description;
  final List<IngredientModel> ingredient;
  final String ingredientImageUrl;
  final List<RecipeModel> recipe;
  final List<ProductModel> preferProducts;
  final CookState cookState;

  CookModel({
    required this.id,
    required this.mainImageUrl,
    required this.name,
    required this.description,
    required this.ingredient,
    required this.ingredientImageUrl,
    required this.recipe,
    required this.preferProducts,
    required this.cookState,
  });

  CookModel copyWith({
    String? id,
    String? mainImageUrl,
    String? name,
    String? description,
    List<IngredientModel>? ingredient,
    String? ingredientImageUrl,
    List<RecipeModel>? recipe,
    List<ProductModel>? preferProducts,
    CookState? cookState,
  }) {
    return CookModel(
      id: id ?? this.id,
      mainImageUrl: mainImageUrl ?? this.mainImageUrl,
      name: name ?? this.name,
      description: description ?? this.description,
      ingredient: ingredient ?? this.ingredient,
      ingredientImageUrl: ingredientImageUrl ?? this.ingredientImageUrl,
      recipe: recipe ?? this.recipe,
      preferProducts: preferProducts ?? this.preferProducts,
      cookState: cookState ?? this.cookState,
    );
  }
}
