import 'package:myapp/models/chapter_model.dart';

class ChapterController {
  static late List<ListChapter> chapters;

  static void init() {
    chapters = [
      ListChapter(
        id: 'doremon-truyen-ngan',
        chapters: [
          Chapter(
            chapNumber: '1',
            images: [
              'https://cdn.blogtruyenmoi.vn/865/865548/',
            ],
          ),
        ],
      ),
    ];
  }
}
