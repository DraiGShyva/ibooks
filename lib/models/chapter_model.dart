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

class ListComicChapter {
  final List<ListChapter> listComicChapter;

  ListComicChapter({
    required this.listComicChapter,
  });

  factory ListComicChapter.fromJson(List<dynamic> json) {
    List<ListChapter> listComicChapter = [];
    for (var element in json) {
      listComicChapter.add(ListChapter.fromJson(element));
    }
    return ListComicChapter(listComicChapter: listComicChapter);
  }

  List<dynamic> toJson() {
    List<dynamic> listComicChapter = [];
    for (var element in this.listComicChapter) {
      listComicChapter.add(element.toJson());
    }
    return listComicChapter;
  }
}
