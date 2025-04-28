class CategoriesModel {
  final int id;
  final String title;

  const CategoriesModel({
    required this.id,
    required this.title,
  });

  factory CategoriesModel.fromJson(Map<String, dynamic> json) {
    return CategoriesModel(
      id: json['id'],
      title: json['title'],
    );
  }

  CategoriesModel copyWith({
    int? id,
    String? title,
  }) {
    return CategoriesModel(
      id: id ?? this.id,
      title: title ?? this.title,
    );
  }
}
