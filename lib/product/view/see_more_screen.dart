import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/component/vertical_item_grid.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';

class SeeMoreScreen extends ConsumerWidget {
  static String get routeName => 'see_more';

  const SeeMoreScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = GoRouterState.of(context).pathParameters['title']!;

    List<ProductModel> products = [];

    switch (title) {
      case 'fresh':
        products = ref
            .read(productProvider)
            .where((element) => element.preferState == ProductPreferState.fresh)
            .toList();
      case 'best':
        products = ref
            .read(productProvider)
            .where((element) => element.preferState == ProductPreferState.best)
            .toList();
      case 'prefer':
        products = ref
            .read(productProvider)
            .where(
                (element) => element.preferState == ProductPreferState.prefer)
            .toList();
      default:
        products = [];
    }

    return DefaultLayout(
      appbar: DefaultAppBar(
          title: ProductPreferState.values
              .firstWhere((element) => element.name == title)
              .label),
      child: VerticalItemList(products: products),
    );
  }
}
