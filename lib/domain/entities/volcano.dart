class Volcano {
  final String id;
  final String name;
  final double height;
  final String difficulty;

  Volcano({
    required this.id,
    required this.name,
    required this.height,
    required this.difficulty,
  });

  Volcano copyWith({
    String? id,
    String? name,
    double? height,
    String? difficulty,
  }) {
    return Volcano(
      id: id ?? this.id,
      name: name ?? this.name,
      height: height ?? this.height,
      difficulty: difficulty ?? this.difficulty,
    );
  }
}
