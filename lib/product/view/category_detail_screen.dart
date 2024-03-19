import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/product/component/vertical_item_grid.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';

class CategoryDetailScreen extends ConsumerWidget {
  static String get routeName => 'category';

  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryId = GoRouterState.of(context).pathParameters['id'];
    final category = DataUtils.getCategoryTitle(index: categoryId!);

    final products = ref
        .watch(productProvider)
        .where((e) => e.category.contains(category))
        .toList();

    return DefaultLayout(
      appbar: DefaultAppBar(title: category),
      child: VerticalItemList(products: products),
    );
  }
}
