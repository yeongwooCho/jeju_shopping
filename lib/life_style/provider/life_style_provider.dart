import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/life_style/model/life_style.dart';

final lifeStyleProvider =
    StateNotifierProvider<LifeStyleStateNotifier, LifeStyleModel>(
  (ref) => LifeStyleStateNotifier(),
);

class LifeStyleStateNotifier extends StateNotifier<LifeStyleModel> {
  LifeStyleStateNotifier()
      : super(LifeStyleModel(
          eating: '육류',
          taste: '짠 맛',
          place: '실내',
          exercise: '안함',
          sleep: '보통',
        ));

  void clear() {
    state = LifeStyleModel();
  }

  void setEating({required String eating}) {
    state = state.copyWith(eating: eating);
  }

  void setTaste({required String taste}) {
    state = state.copyWith(taste: taste);
  }

  void setPlace({required String place}) {
    state = state.copyWith(place: place);
  }

  void setExercise({required String exercise}) {
    state = state.copyWith(exercise: exercise);
  }

  void setSleep({required String sleep}) {
    state = state.copyWith(sleep: sleep);
  }
}
