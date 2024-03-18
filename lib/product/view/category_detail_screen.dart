import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';
import 'package:jeju_shopping/product/view/product_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CategoryDetailScreen extends ConsumerWidget {
  static String get routeName => 'category';

  const CategoryDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final categoryId = GoRouterState.of(context).pathParameters;
    print(categoryId);

    final products = ref.read(productProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(
        title: categoryId.toString(),
        leading: IconButton(
          onPressed: () {
            context.goNamed(ProductScreen.routeName);
          },
          icon: PhosphorIcon(
            PhosphorIcons.caretLeft(),
          ),
        ),
      ),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.pop();
            },
            child: Text('dfsa'),
          ),
          Text('afsd'),
        ],
      ),
    ); //VerticalItemList(products: products);
  }
}
