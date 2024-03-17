import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/component/see_more_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/component/horizontal_item_list.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';

class ProductScreen extends ConsumerWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(productProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '홈'),
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
          SliverToBoxAdapter(child: DividerContainer()),
          SliverToBoxAdapter(child: const SizedBox(height: 40.0)),
          renderProducts(title: '신선하고 깔끔한 프레시 상품', products: state),
          SliverToBoxAdapter(child: const SizedBox(height: 40.0)),
          renderProducts(title: '가장 많이 판매된 베스트 상품', products: state),
          SliverToBoxAdapter(child: const SizedBox(height: 40.0)),
          renderProducts(title: '고객님 맞춤 추천 상품', products: state),
          SliverToBoxAdapter(child: const SizedBox(height: 40.0)),
        ],
      ),
    );
  }

  SliverToBoxAdapter renderProducts({
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
              children: [
                Text(
                  title,
                  style: MyTextStyle.bodyTitleBold,
                ),
                SeeMoreButton(
                  onTap: () {},
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
              return Padding(
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
                      getCategoryTitle(index: index),
                      style: MyTextStyle.descriptionRegular.copyWith(
                        color: MyColor.darkGrey,
                      ),
                    ),
                  ],
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

  String getCategoryTitle({
    required int index,
  }) {
    switch (index) {
      case 0:
        return Category.special.label;
      case 1:
        return Category.agricultural.label;
      case 2:
        return Category.sea.label;
      case 3:
        return Category.livestock.label;
      case 4:
        return Category.healthy.label;
      case 5:
        return Category.convenience.label;
      default:
        return '';
    }
  }
}
