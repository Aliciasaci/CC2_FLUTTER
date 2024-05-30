class Tag {
  final String title;
  final String description;
  final String category;

  Tag({required this.title, required this.description, required this.category});

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      title: json['title'],
      description: json['description'],
      category: json['category'],
    );
  }
}
