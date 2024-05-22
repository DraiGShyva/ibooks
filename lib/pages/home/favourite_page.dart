import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_item_comic.dart';
import 'package:myapp/components/my_app_list_view.dart';
import 'package:myapp/controller/account_controller.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/controller/comic_controller.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    final accountController = Get.put(AccountController());
    final authenKey = Get.put(AppController()).authenKey.value;
    final comics = Get.put(ComicController()).comics.value.listComic;
    List listComic = comics
        .where((comic) =>
            accountController.getFavouriteList(authenKey).contains(comic.id))
        .toList();

    if (authenKey.isEmpty) {
      return const Center(
        child: Text('Please login to view your favourite list.'),
      );
    }

    if (listComic.isEmpty) {
      return const Center(
        child: Text('Your favourite list is empty.'),
      );
    }

    return MyAppListView(
      itemsList: listComic,
      itemWidget: (comic) => MyAppItemComic(
        context: context,
        comic: comic,
        setState: () => setState(() {}),
      ),
    );
  }
}
