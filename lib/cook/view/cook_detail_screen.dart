import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:jeju_shopping/cart/provider/cart_provider.dart';
import 'package:jeju_shopping/cart/view/cart_screen.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';
import 'package:jeju_shopping/cook/provider/cook_provider.dart';
import 'package:jeju_shopping/product/component/vertical_item_grid.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CookDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'cook_detail';

  const CookDetailScreen({super.key});

  @override
  ConsumerState<CookDetailScreen> createState() => _CookDetailScreenState();
}

class _CookDetailScreenState extends ConsumerState<CookDetailScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final id = GoRouterState.of(context).pathParameters['id']!;
    final cook =
        ref.watch(cookProvider).firstWhere((element) => element.id == id);

    final carts = ref.watch(cartProvider);

    final fullWidth = MediaQuery.of(context).size.width;
    final safeTopPadding = MediaQuery.of(context).padding.top;

    return DefaultLayout(
      appbar: Hidable(
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        controller: scrollController,
        child: DefaultAppBar(
          title: '',
          action: [
            IconButton(
              onPressed: () {
                context.pushNamed(CartScreen.routeName);
              },
              iconSize: 30.0,
              icon: badges.Badge(
                showBadge: carts.isNotEmpty,
                badgeContent: Text(
                  carts.length.toString(),
                  style: MyTextStyle.minimumRegular.copyWith(
                    color: MyColor.white,
                    height: 1.0,
                  ),
                ),
                child: PhosphorIcon(PhosphorIcons.shoppingCart()),
              ),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              cook.mainImageUrl,
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.cover,
            ),
            // renderProductInfo(product: product),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 32.0,
              ),
              child: Text(
                cook.name,
                style: MyTextStyle.bigTitleBold,
              ),
            ),
            const DividerContainer(),
            renderFoodDescription(description: cook.description),
            const DividerContainer(),
            renderIngredient(ingredient: cook.ingredient),
            const DividerContainer(),
            renderRecipe(recipe: cook.recipe),
            const DividerContainer(),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                top: 32.0,
                right: 24.0,
              ),
              child: const Text(
                '레시피에 포함된 상품',
                style: MyTextStyle.bigTitleBold,
              ),
            ),
            VerticalItemList(products: cook.preferProducts),
            Padding(
              padding: const EdgeInsets.only(
                left: 24.0,
                bottom: 40.0,
                right: 24.0,
              ),
              child: SecondaryButton(
                onPressed: () {
                  ref
                      .read(cartProvider.notifier)
                      .addAllProduct(products: cook.preferProducts);
                },
                child: Text('장바구니에 모두 담기'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget renderFoodDescription({
    required String description,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '음식 설명',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          Text(
            description,
            style: MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }

  Widget renderIngredient({
    required List<IngredientModel> ingredient,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '필수 재료',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          ...ingredient.map(
            (e) => Padding(
              padding: const EdgeInsets.only(bottom: 4.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    e.title,
                    style: MyTextStyle.minimumRegular,
                  ),
                  Text(
                    e.description,
                    style: MyTextStyle.minimumRegular,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget renderRecipe({
    required List<RecipeModel> recipe,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '레시피',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 8.0),
          ...recipe.mapIndexed(
            (index, e) => Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: IntrinsicHeight(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(
                      e.imageUrl,
                      height: 120.0,
                      width: 120.0,
                      fit: BoxFit.cover,
                    ),
                    const SizedBox(width: 12.0),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            "STEP ${index + 1}",
                            style: MyTextStyle.descriptionRegular,
                            textAlign: TextAlign.start,
                          ),
                          Text(
                            e.description,
                            style: MyTextStyle.descriptionRegular,
                            textAlign: TextAlign.start,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}