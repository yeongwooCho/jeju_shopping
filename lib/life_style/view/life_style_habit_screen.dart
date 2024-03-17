import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/life_style/component/check_container.dart';
import 'package:jeju_shopping/life_style/model/enum/life_style_title.dart';

class LifeStyleHabitScreen extends StatelessWidget {
  static String get routeName => 'life';

  const LifeStyleHabitScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '라이프스타일 조사(2/2)'),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 40.0, right: 24.0, left: 24.0),
        child: PrimaryButton(
          onPressed: () async {
            context.goNamed(routeName);
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
              '평소 생활습관을\n선택해 주세요.',
              style: MyTextStyle.headTitle,
            ),
            SizedBox(height: 32.0),
            CheckContainer(
              title: LifeStyleTitle.place,
              data: ['실내', '실외'],
              descriptions: [],
            ),
            SizedBox(height: 24.0),
            CheckContainer(
              title: LifeStyleTitle.exercise,
              data: ['자주', '가끔', '안함'],
              descriptions: ['주 3회 이상', '주 2~3회', '주 1회 이하'],
            ),
            SizedBox(height: 24.0),
            CheckContainer(
              title: LifeStyleTitle.sleep,
              data: ['많음', '보통', '적음'],
              descriptions: ['겨울잠', '8시간 내외', '5시간 미만'],
            ),
          ],
        ),
      ),
    );
  }
}
