import 'package:get/get.dart';
import 'package:myapp/models/chapter_model.dart';

class ChapterController extends GetxController {
  final listComicChapter = ListComicChapter(listComicChapter: []).obs;
  final isLoading = true.obs;

  @override
  void onInit() {
    fetchChapters();
    super.onInit();
  }

  Future<void> fetchChapters() async {
    isLoading(true);
    final chaptersData = await ChapterService.fetchChapters();
    // ignore: unnecessary_null_comparison
    if (chaptersData != null) {
      listComicChapter(chaptersData);
    }
    isLoading(false);
  }

  ListChapter getListChapter(String id) {
    return listComicChapter.value.listComicChapter
        .firstWhere((element) => element.id == id);
  }

  Chapter getChapter(String id, String chapNumber) {
    return getListChapter(id)
        .chapters
        .firstWhere((element) => element.chapNumber == chapNumber);
  }
}

class ChapterService {
  static Future<ListComicChapter> fetchChapters() async {
    return ListComicChapter.fromJson(_listComicChapterJson);
  }

  static final _listComicChapterJson = [
    {
      "id": "tu-linh-su-thien-tai-cua-hoc-vien",
      "chapters": [
        {
          "chapNumber": "1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-5.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-6.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "2",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "3",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-6.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "4",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
          ]
        },
        {
          "chapNumber": "5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-5.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-6.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
          ]
        },
        {
          "chapNumber": "6",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
      ]
    },
    {
      "id": "thien-phong-phach-dao",
      "chapters": [
        {
          "chapNumber": "1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-5.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-6.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "2.1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "3",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "4",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "6.2",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
      ]
    },
    {
      "id": "chuyen-sinh-thanh-ac-nhan",
      "chapters": [
        {
          "chapNumber": "1.1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "2",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "3.1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "4",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-5.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "6",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-5.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
      ]
    },
    {
      "id": "toan-tri-doc-gia",
      "chapters": [
        {
          "chapNumber": "1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "2",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "3.3",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "4",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-5.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "5.5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
      ]
    },
    {
      "id": "thien-qua-thu-kho-dai-cong-tu",
      "chapters": [
        {
          "chapNumber": "1",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "2",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "3",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "3.5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-9.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-10.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "5",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-3.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-4.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-11.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
        {
          "chapNumber": "10",
          "images": [
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-1.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-2.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-6.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-7.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-8.jpg",
            "assets/images/chapters/tu-linh-su-thien-tai-cua-hoc-vien-12.jpg",
          ]
        },
      ]
    },
  ];
}
