class Chapter {
  final String chapNumber;
  final List images;

  Chapter({
    required this.chapNumber,
    required this.images,
  });

  factory Chapter.fromJson(Map<String, dynamic> json) {
    return Chapter(
      chapNumber: json['chapNumber'],
      images: json['images'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chapNumber': chapNumber,
      'images': images,
    };
  }
}

class ListChapter {
  final String id;
  final List<Chapter> chapters;

  ListChapter({
    required this.id,
    required this.chapters,
  });

  factory ListChapter.fromJson(Map<String, dynamic> json) {
    List<Chapter> chapters = [];
    for (var element in json['chapters']) {
      chapters.add(Chapter.fromJson(element));
    }
    return ListChapter(id: json['id'], chapters: chapters);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chapters': chapters.map((e) => e.toJson()).toList(),
    };
  }
}
