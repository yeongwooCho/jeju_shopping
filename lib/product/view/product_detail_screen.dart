import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class ProductDetailScreen extends ConsumerWidget {
  static String get routeName => 'product_detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = GoRouterState.of(context).pathParameters['id'];

    return DefaultLayout(
      appbar: DefaultAppBar(title: ''),
      child: Column(
        children: [
          Text(id!),
        ],
      ),
    );
  }
}
