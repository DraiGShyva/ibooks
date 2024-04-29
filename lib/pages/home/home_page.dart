import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_auto_page_view.dart';
import 'package:myapp/components/my_app_bottom_navigation_bar.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_item_comic.dart';
import 'package:myapp/components/my_app_list_view.dart';
import 'package:myapp/data/comic_data.dart';
import 'package:myapp/my_app.dart';
import 'package:myapp/pages/home/account_page.dart';
import 'package:myapp/pages/home/chat_page.dart';
import 'package:myapp/pages/home/favourite_page.dart';

class HomePage extends StatefulWidget {
  final NotchBottomBarController? controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    ComicData.init();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppListView(
        itemsData: ComicData.comics,
        itemWidget: (comic) => MyAppItemComic(
          context: context,
          comic: comic,
          setState: () => setState(() {}),
        ),
        otherWidget: MyAppAutoPageView(
          pages: List.generate(
            ComicData.comics.length < 3 ? ComicData.comics.length : 3,
            (index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyApp.LIST_CHAPTER, arguments: {
                  'id': ComicData.comics[index].id,
                });
              },
              child: MyAppImage(
                imageUrl: '${ComicData.comics[index].image}',
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class MyBottomNavigationBar extends StatelessWidget {
  MyBottomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyAppBottomNavigationBar(
        bottomBarPages: bottomBarPages,
        bottomBarItems: bottomBarItems,
      ),
    );
  }

  final List<Widget> bottomBarPages = [
    const HomePage(),
    const FavouritePage(),
    const ChatPage(),
    const AccountPage(),
  ];

  final List<BottomBarItem> bottomBarItems = [
    const BottomBarItem(
      itemLabel: 'Home',
      inActiveItem: Icon(
        Icons.home_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.home_filled,
        color: Colors.blueAccent,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Favourite',
      inActiveItem: Icon(Icons.star_border, color: Colors.blueGrey),
      activeItem: Icon(
        Icons.star,
        color: Colors.amber,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Chat',
      inActiveItem: Icon(
        Icons.chat_outlined,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.chat,
        color: Colors.red,
      ),
    ),
    const BottomBarItem(
      itemLabel: 'Account',
      inActiveItem: Icon(
        Icons.person_outline,
        color: Colors.blueGrey,
      ),
      activeItem: Icon(
        Icons.person,
        color: Colors.green,
      ),
    ),
  ];
}
