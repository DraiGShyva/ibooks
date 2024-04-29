import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_item_comic.dart';
import 'package:myapp/components/my_app_list_view.dart';
import 'package:myapp/data/account_data.dart';
import 'package:myapp/data/comic_data.dart';
import 'package:myapp/my_app.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({super.key});

  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {
  @override
  Widget build(BuildContext context) {
    if (MyApp.username == null) {
      return const Scaffold(
        body: Center(
          child: Text('Please login to view your favourite list.'),
        ),
      );
    }

    List listComic = ComicData.comics
        .where((comic) =>
            AccountData.getFavouriteList(MyApp.username!).contains(comic.id))
        .toList();

    if (listComic.isEmpty) {
      return const Scaffold(
        body: Center(
          child: Text('Your favourite list is empty.'),
        ),
      );
    }

    return Scaffold(
      body: MyAppListView(
        itemsData: listComic,
        itemWidget: (comic) => MyAppItemComic(
          context: context,
          comic: comic,
          setState: () => setState(() {}),
        ),
      ),
    );
  }
}
