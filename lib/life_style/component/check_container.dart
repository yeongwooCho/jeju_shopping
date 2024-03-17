import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/component/custom_ink_well_button.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/life_style/model/enum/life_style_title.dart';
import 'package:jeju_shopping/life_style/provider/life_style_provider.dart';

class CheckContainer extends ConsumerWidget {
  final LifeStyleTitle title;
  final List<String> data;
  final List<String> descriptions;

  const CheckContainer({
    super.key,
    required this.title,
    required this.data,
    this.descriptions = const [],
  });

  String getTitle() {
    switch (title) {
      case LifeStyleTitle.eating:
        return '주로 섭취하는 음식';
      case LifeStyleTitle.taste:
        return '선호하는 맛';
      case LifeStyleTitle.place:
        return '주 활동 장소';
      case LifeStyleTitle.exercise:
        return '운동 여부';
      case LifeStyleTitle.sleep:
        return '일일 평균 수명 시간';
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final itemWidth = (MediaQuery.of(context).size.width - 64) / 3;
    final state = ref.watch(lifeStyleProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          getTitle(),
          style: MyTextStyle.bodyRegular,
        ),
        const SizedBox(height: 8.0),
        Wrap(
          alignment: WrapAlignment.start,
          spacing: 8.0,
          runSpacing: 8.0,
          crossAxisAlignment: WrapCrossAlignment.start,
          children: [
            ...data.mapIndexed(
              (index, e) => SizedBox(
                width: itemWidth,
                child: CustomInkWellButton(
                  title: e,
                  description:
                      descriptions.isNotEmpty ? descriptions[index] : '',
                  onTap: () {
                    final stateNotifier = ref.read(lifeStyleProvider.notifier);
                    switch (title) {
                      case LifeStyleTitle.eating:
                        stateNotifier.setEating(eating: e);
                      case LifeStyleTitle.taste:
                        stateNotifier.setTaste(taste: e);
                      case LifeStyleTitle.place:
                        stateNotifier.setPlace(place: e);
                      case LifeStyleTitle.exercise:
                        stateNotifier.setExercise(exercise: e);
                      case LifeStyleTitle.sleep:
                        stateNotifier.setSleep(sleep: e);
                    }
                  },
                  isSelected: e == state.eating ||
                      e == state.taste ||
                      e == state.place ||
                      e == state.exercise ||
                      e == state.sleep,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
