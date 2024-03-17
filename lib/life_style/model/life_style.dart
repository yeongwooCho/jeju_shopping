class LifeStyleModel {
  final String eating;
  final String taste;
  final String place;
  final String exercise;
  final String sleep;

  LifeStyleModel({
    this.eating = '',
    this.taste = '',
    this.place = '',
    this.exercise = '',
    this.sleep = '',
  });

  LifeStyleModel copyWith({
    String? eating,
    String? taste,
    String? place,
    String? exercise,
    String? sleep,
  }) {
    return LifeStyleModel(
      eating: eating ?? this.eating,
      taste: taste ?? this.taste,
      place: place ?? this.place,
      exercise: exercise ?? this.exercise,
      sleep: sleep ?? this.sleep,
    );
  }
}
