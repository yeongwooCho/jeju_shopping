import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/component/see_more_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/cook/component/horizontal_item_list_cook.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';

class CookScreen extends StatelessWidget {
  static String get routeName => 'cook';

  const CookScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '웰빙쿡'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            const SliverToBoxAdapter(
              child: Text(
                '라이프 스타일에 맞춰\n요리 레시피를 추천합니다.',
                style: MyTextStyle.headTitle,
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            renderCooks(
              kind: CookState.breakfast.label,
              title: '가벼운 음식',
              cooks: [],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            renderCooks(
              kind: CookState.lunch.label,
              title: '일반식',
              cooks: [],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
            renderCooks(
              kind: CookState.dinner.label,
              title: '위에 부담이 적은 음식',
              cooks: [],
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40.0)),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter renderCooks({
    required String kind,
    required String title,
    required List<CookModel> cooks,
  }) {
    return SliverToBoxAdapter(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
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
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 8.0),
          HorizontalItemListCook(cooks: cooks),
        ],
      ),
    );
  }
}
