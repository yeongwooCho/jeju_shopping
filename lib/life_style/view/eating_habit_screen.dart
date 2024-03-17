import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/life_style/component/check_container.dart';
import 'package:jeju_shopping/life_style/model/enum/life_style_title.dart';
import 'package:jeju_shopping/life_style/view/life_style_habit_screen.dart';

class EatingHabitScreen extends StatelessWidget {
  static String get routeName => 'eating';

  const EatingHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '라이프스타일 조사(1/2)'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            context.goNamed(LifeStyleHabitScreen.routeName);
          },
          child: const Text('다음'),
        ),
      ),
      child: const Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(height: 60.0),
            Text(
              '평소 식습관을\n선택해 주세요.',
              style: MyTextStyle.headTitle,
            ),
            SizedBox(height: 32.0),
            CheckContainer(
              title: LifeStyleTitle.eating,
              data: ['육류', '채소류', '해산물'],
            ),
            SizedBox(height: 24.0),
            CheckContainer(
              title: LifeStyleTitle.taste,
              data: ['단 맛', '짠 맛', '싱거운 맛', '매운 맛'],
            ),
          ],
        ),
      ),
    );
  }
}
