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
        otherWidget: Stack(
          children: [_pageView(), _listButton()],
        ),
      ),
    );
  }

  Widget _pageView() => Padding(
        padding: const EdgeInsets.only(bottom: 40.0),
        child: MyAppAutoPageView(
          pages: List.generate(
            ComicData.comics.length < 3 ? ComicData.comics.length : 3,
            (index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, MyApp.LIST_CHAPTER,
                    arguments: {'id': ComicData.comics[index].id});
              },
              child: ShaderMask(
                shaderCallback: (rect) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.transparent,
                      Colors.black,
                      Colors.black,
                      Colors.transparent,
                    ],
                    stops: [0.0, 0.2, 0.8, 1.0],
                  ).createShader(rect);
                },
                blendMode: BlendMode.dstIn,
                child: MyAppImage(
                  imageUrl: '${ComicData.comics[index].image}',
                  width: MediaQuery.of(context).size.width,
                ),
              ),
            ),
          ),
        ),
      );

  final List _bannerButtons = [
    {
      'icon': Icons.search,
      'label': 'Search',
      'onTap': () {
        print('Search');
      }
    },
    {
      'icon': Icons.sell_outlined,
      'label': 'Category',
      'onTap': () {
        print('Category');
      }
    },
    {
      'icon': Icons.notifications,
      'label': 'Notification',
      'onTap': () {
        print('Notification');
      }
    },
    {
      'icon': Icons.history,
      'label': 'History',
      'onTap': () {
        print('History');
      }
    },
  ];

  Widget _listButton() {
    return Column(
      children: [
        const SizedBox(height: 218),
        Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                _bannerButtons.length,
                (index) => Transform.rotate(
                  angle: 0.8,
                  child: InkWell(
                    onTap: _bannerButtons[index]['onTap'],
                    borderRadius: BorderRadius.circular(10),
                    child: Ink(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            spreadRadius: 1.0,
                            blurRadius: 5.0,
                          ),
                        ],
                      ),
                      child: Transform.rotate(
                        angle: -0.8,
                        child: Icon(
                          _bannerButtons[index]['icon'],
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
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
