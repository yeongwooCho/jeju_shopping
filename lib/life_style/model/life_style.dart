class LifeStyleModel {
  final String eating;
  final String taste;
  final String place;
  final String sleep;
  final String exercise;

  LifeStyleModel({
    this.eating = '',
    this.taste = '',
    this.place = '',
    this.sleep = '',
    this.exercise = '',
  });

  LifeStyleModel copyWith({
    String? eating,
    String? taste,
    String? place,
    String? sleep,
    String? exercise,
  }) {
    return LifeStyleModel(
      eating: eating ?? this.eating,
      taste: taste ?? this.taste,
      place: place ?? this.place,
      sleep: sleep ?? this.sleep,
      exercise: exercise ?? this.exercise,
    );
  }
}
