import 'package:myapp/models/chapter_model.dart';

class ChapterData {
  static late List<ChapterModel> chapters;

  static void init() {
    chapters = [
      ChapterModel(
        id: 'doremon-truyen-ngan-24988',
        chapters: [
          Chapter(
            chapNumber: '1',
            images: 'https://cdn.blogtruyenmoi.vn/865/865548/',
            imageCount: 156,
          ),
          Chapter(
            chapNumber: '2',
            images: 'https://cdn.blogtruyenmoi.vn/865/865547/',
            imageCount: 191,
          ),
          Chapter(
            chapNumber: '3',
            images: 'https://cdn.blogtruyenmoi.vn/865/865545/',
            imageCount: 190,
          ),
          Chapter(
            chapNumber: '4',
            images: 'https://cdn.blogtruyenmoi.vn/865/865542/',
            imageCount: 191,
          ),
          Chapter(
            chapNumber: '5',
            images: 'https://cdn.blogtruyenmoi.vn/865/865539/',
            imageCount: 188,
          ),
          Chapter(
            chapNumber: '6',
            images: 'https://cdn.blogtruyenmoi.vn/865/865535/',
            imageCount: 190,
          ),
          Chapter(
            chapNumber: '7',
            images: 'https://cdn.blogtruyenmoi.vn/865/865532/',
            imageCount: 190,
          ),
          Chapter(
            chapNumber: '8',
            images: 'https://cdn.blogtruyenmoi.vn/865/865530/',
            imageCount: 189,
          ),
          Chapter(
            chapNumber: '9',
            images: 'https://cdn.blogtruyenmoi.vn/865/865527/',
            imageCount: 188,
          ),
          Chapter(
            chapNumber: '10',
            images: 'https://cdn.blogtruyenmoi.vn/865/865524/',
            imageCount: 187,
          ),
          Chapter(
            chapNumber: '11',
            images: 'https://cdn.blogtruyenmoi.vn/865/865518/',
            imageCount: 186,
          ),
          Chapter(
            chapNumber: '12',
            images: 'https://cdn.blogtruyenmoi.vn/865/865514/',
            imageCount: 188,
          ),
        ],
      ),
      ChapterModel(
        id: 'one-piece-24458',
        chapters: [
          Chapter(
            chapNumber: '1',
            images: 'https://cdn.blogtruyenmoi.vn/2/2240/chuong-001-op01-',
            imageCount: 53,
          ),
          Chapter(
            chapNumber: '2',
            images: 'https://cdn.blogtruyenmoi.vn/2/2241/op02-',
            imageCount: 23,
          ),
          Chapter(
            chapNumber: '3',
            images: 'https://cdn.blogtruyenmoi.vn/2/2242/op03-',
            imageCount: 21,
          ),
        ],
      ),
    ];
  }
}
