class Tag {
  final String title;

  Tag({
    required this.title,
  });

  factory Tag.fromJson(Map<String, dynamic> json) {
    return Tag(
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
    };
  }

  @override
  String toString() {
    return '{title: $title';
  }
}
