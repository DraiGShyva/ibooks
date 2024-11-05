import 'package:get/get.dart';
import 'package:myapp/controller/service/chapter_controller.dart';
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
