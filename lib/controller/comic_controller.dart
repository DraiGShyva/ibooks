import 'package:get/get.dart';
import 'package:myapp/controller/service/comic_servive.dart';
import 'package:myapp/models/comic_model.dart';

class ComicController extends GetxController {
  final comics = ListComic(listComic: [Comic(id: '')]).obs;
  final onLoading = true.obs;

  @override
  void onInit() {
    fetchComic();
    super.onInit();
  }

  void fetchComic() async {
    onLoading(true);
    final comicData = await ComicService.fetchComic();
    if (comicData != null) {
      comics(comicData);
    }
    onLoading(false);
  }

  Comic getComic(String id) {
    return comics().listComic.firstWhere((comic) => comic.id == id);
  }
}
