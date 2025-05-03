class Category {
  final String id;
  final String name;
  final String thumbnail;

  Category({required this.id, required this.name, required this.thumbnail});

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['idCategory'],
      name: json['strCategory'],
      thumbnail: json['strCategoryThumb'],
    );
  }
}
