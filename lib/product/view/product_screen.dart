import 'package:badges/badges.dart' as badges;
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/cart/provider/cart_provider.dart';
import 'package:jeju_shopping/cart/view/cart_screen.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/component/see_more_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/product/component/horizontal_item_list.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';
import 'package:jeju_shopping/product/view/category_detail_screen.dart';
import 'package:jeju_shopping/product/view/search_screen.dart';
import 'package:jeju_shopping/product/view/see_more_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.watch(productProvider);

    final freshProducts = products
        .where((element) => element.preferState == ProductPreferState.fresh)
        .toList();
    final bestProducts = products
        .where((element) => element.preferState == ProductPreferState.best)
        .toList();
    final preferProducts = products
        .where((element) => element.preferState == ProductPreferState.prefer)
        .toList();

    final carts = ref.watch(cartProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: '',
        titleWidget: Image.asset(
          'asset/img/logo/name.png',
          height: 24.0,
        ),
        centerTitle: false,
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
          IconButton(
            onPressed: () {
              context.pushNamed(SearchScreen.routeName);
            },
            iconSize: 30.0,
            icon: PhosphorIcon(PhosphorIcons.magnifyingGlass()),
          ),
          const SizedBox(width: 8.0),
        ],
      ),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'asset/img/category/banner.png',
              fit: BoxFit.contain,
            ),
          ),
          renderCategories(),
          const SliverToBoxAdapter(child: DividerContainer()),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          renderProducts(
            context: context,
            title: ProductPreferState.fresh.label,
            products: freshProducts,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          renderProducts(
            context: context,
            title: ProductPreferState.best.label,
            products: bestProducts,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          renderProducts(
            context: context,
            title: ProductPreferState.prefer.label,
            products: preferProducts,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
        ],
      ),
    );
  }

  SliverToBoxAdapter renderProducts({
    required BuildContext context,
    required String title,
    required List<ProductModel> products,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: MyTextStyle.bodyTitleBold,
                ),
                SeeMoreButton(
                  title: '더보기',
                  onTap: () {
                    if (title == ProductPreferState.fresh.label) {
                      context.goNamed(
                        SeeMoreScreen.routeName,
                        pathParameters: {
                          'title': 'fresh',
                        },
                      );
                    } else if (title == ProductPreferState.best.label) {
                      context.goNamed(
                        SeeMoreScreen.routeName,
                        pathParameters: {
                          'title': 'best',
                        },
                      );
                    } else {
                      context.goNamed(
                        SeeMoreScreen.routeName,
                        pathParameters: {
                          'title': 'prefer',
                        },
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          HorizontalItemList(products: products),
        ],
      ),
    );
  }

  SliverPadding renderCategories() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 84.0,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.goNamed(
                    CategoryDetailScreen.routeName,
                    pathParameters: {
                      'id': index.toString(),
                    },
                  );
                },
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Column(
                    children: [
                      Container(
                        width: 48.0,
                        decoration: BoxDecoration(
                          color: MyColor.lightGrey,
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Image.asset(
                            'asset/img/category/category_$index.png',
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                      const SizedBox(height: 4.0),
                      Text(
                        DataUtils.getCategoryTitle(index: index.toString()),
                        style: MyTextStyle.descriptionRegular.copyWith(
                          color: MyColor.darkGrey,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8.0);
            },
          ),
        ),
      ),
    );
  }
}
