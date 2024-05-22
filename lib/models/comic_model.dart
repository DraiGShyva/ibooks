class Comic {
  final String id;
  final String? title;
  final String? img;
  final String? author;
  final List<String>? category;
  final String? description;

  Comic({
    required this.id,
    this.title,
    this.img,
    this.author,
    this.category,
    this.description,
  });

  factory Comic.fromJson(Map<String, dynamic> json) {
    return Comic(
      id: json['id'],
      title: json['title'],
      author: json['author'],
      category: List<String>.from(json['category']),
      description: json['description'],
      img: json['img'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'author': author,
      'category': category,
      'description': description,
      'img': img,
    };
  }
}

class ListComic {
  final List<Comic> listComic;

  ListComic({required this.listComic});

  factory ListComic.fromJson(List<dynamic> json) {
    List<Comic> listComic = [];
    for (var element in json) {
      listComic.add(Comic.fromJson(element));
    }
    return ListComic(listComic: listComic);
  }

  List<Map<String, dynamic>> toJson() {
    List<Map<String, dynamic>> listComic = [];
    for (var element in this.listComic) {
      listComic.add(element.toJson());
    }
    return listComic;
  }
}
