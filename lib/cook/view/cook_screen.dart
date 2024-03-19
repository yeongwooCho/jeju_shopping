import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/see_more_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/cook/component/horizontal_item_list_cook.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';
import 'package:jeju_shopping/cook/provider/cook_provider.dart';
import 'package:jeju_shopping/cook/view/see_more_cook_screen.dart';

class CookScreen extends ConsumerWidget {
  static String get routeName => 'cook';

  const CookScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cooks = ref.watch(cookProvider);

    final breakfasts = cooks
        .where((element) => element.cookState == CookState.breakfast)
        .toList();
    final lunches =
        cooks.where((element) => element.cookState == CookState.lunch).toList();
    final dinners = cooks
        .where((element) => element.cookState == CookState.dinner)
        .toList();

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '웰빙쿡'),
      child: CustomScrollView(
        physics: const BouncingScrollPhysics(),
        slivers: [
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          const SliverToBoxAdapter(
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                '라이프 스타일에 맞춰\n요리 레시피를 추천합니다.',
                style: MyTextStyle.headTitle,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          renderCooks(
            context: context,
            kind: CookState.breakfast.label,
            title: '가벼운 음식',
            cooks: breakfasts,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          renderCooks(
            context: context,
            kind: CookState.lunch.label,
            title: '일반식',
            cooks: lunches,
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          renderCooks(
            context: context,
            kind: CookState.dinner.label,
            title: '위에 부담이 적은 음식',
            cooks: dinners,
          ),
        ],
      ),
    );
  }

  SliverToBoxAdapter renderCooks({
    required BuildContext context,
    required String kind,
    required String title,
    required List<CookModel> cooks,
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
                Row(
                  children: [
                    Text(
                      kind,
                      style: MyTextStyle.bodyTitleBold.copyWith(
                        color: MyColor.primary,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    Text(
                      title,
                      style: MyTextStyle.bodyTitleBold,
                    ),
                  ],
                ),
                SeeMoreButton(
                  title: '더보기',
                  onTap: () {
                    context.goNamed(
                      SeeMoreCookScreen.routeName,
                      pathParameters: {
                        'title': kind,
                      },
                    );
                  },
                ),
              ],
            ),
          ),
          const SizedBox(height: 8.0),
          HorizontalItemListCook(cooks: cooks),
        ],
      ),
    );
  }
}
