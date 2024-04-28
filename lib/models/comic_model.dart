class ComicModel {
  final String id;
  final String? title;
  final String? author;
  final String? category;
  final String? description;
  final String? image;

  ComicModel({
    required this.id,
    this.title,
    this.author,
    this.category,
    this.description,
    this.image,
  });

  factory ComicModel.fromJson(Map<String, dynamic> json) {
    return ComicModel(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: json['category'],
      description: json['description'],
      image: json['image'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'image': image,
    };
  }
}
