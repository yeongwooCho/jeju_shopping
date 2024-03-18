import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/component/vertical_item_grid.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';

class SearchDetailScreen extends ConsumerWidget {
  static String get routeName => 'search_detail';

  const SearchDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final products = ref.read(productProvider);

    return DefaultLayout(
      appbar: DefaultAppBar(title: '검색 결과'),
      child: VerticalItemList(products: products),
    );
  }
}
