import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/cook/provider/cook_provider.dart';

class CookDetailScreen extends ConsumerWidget {
  static String get routeName => 'cook_detail';

  const CookDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final id = GoRouterState.of(context).pathParameters['id']!;

    final cook = ref.watch(cookProvider).firstWhere(
          (element) => element.id == id,
        );

    return DefaultLayout(
      appbar: DefaultAppBar(title: ''),
      child: Column(
        children: [
          Text(
            cook.id.toString(),
          ),
        ],
      ),
    );
  }
}
