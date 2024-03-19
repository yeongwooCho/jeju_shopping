import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/cook/component/vertical_item_grid_cook.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';
import 'package:jeju_shopping/cook/provider/cook_provider.dart';

class SeeMoreCookScreen extends ConsumerWidget {
  static String get routeName => 'see_more_cook';

  const SeeMoreCookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final title = GoRouterState.of(context).pathParameters['title']!;

    List<CookModel> cooks = [];

    switch (title) {
      case '아침':
        cooks = ref
            .read(cookProvider)
            .where((element) => element.cookState == CookState.breakfast)
            .toList();
      case '점심':
        cooks = ref
            .read(cookProvider)
            .where((element) => element.cookState == CookState.lunch)
            .toList();
      case '저녁':
        cooks = ref
            .read(cookProvider)
            .where((element) => element.cookState == CookState.dinner)
            .toList();
      default:
        cooks = [];
    }

    return DefaultLayout(
      appbar: DefaultAppBar(title: title),
      child: VerticalItemListCook(cooks: cooks),
    );
  }
}
