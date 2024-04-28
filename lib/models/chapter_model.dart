//chapter model
class ChapterModel {
  final String id;
  final List<Chapter> chapters;

  ChapterModel({
    required this.id,
    required this.chapters,
  });

  factory ChapterModel.fromJson(Map<String, dynamic> json) {
    return ChapterModel(
      id: json['id'],
      chapters: json['chapters'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'chapters': chapters,
    };
  }
}

class Chapter {
  final String chapNumber;
  final String images;
  final int imageCount;

  Chapter({
    required this.chapNumber,
    required this.images,
    required this.imageCount,
  });
}
