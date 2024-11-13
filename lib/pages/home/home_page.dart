import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ibooks/components/my_app_auto_page_view.dart';
import 'package:ibooks/components/my_app_button_diamond.dart';
import 'package:ibooks/components/my_app_image.dart';
import 'package:ibooks/components/my_app_item_comic.dart';
import 'package:ibooks/components/my_app_list_view.dart';
import 'package:ibooks/components/my_app_notification.dart';
import 'package:ibooks/controller/app_controller.dart';
import 'package:ibooks/controller/banner_controller.dart';
import 'package:ibooks/controller/comic_controller.dart';
import 'package:ibooks/utils/colors.dart';
import 'package:ibooks/utils/route.dart';

class HomePage extends StatefulWidget {
  final NotchBottomBarController? controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _banners = Get.put(BannerController()).banners.value.listBanner;
  final _comics = Get.put(ComicController()).comics.value.listComic;
  final double bannerHeith = 150.0;

  @override
  Widget build(BuildContext context) {
    final List listButton = [
      {
        'name': 'Search',
        'icon': Icons.search,
        'onPressed': () => Navigator.pushNamed(context, SEARCH, arguments: {
              'searchItem': _comics,
            }),
      },
      {
        'name': 'Category',
        'icon': Icons.sell_outlined,
        'onPressed': () =>
            Navigator.pushNamed(context, CATEGORY_SELECTION, arguments: {
              'items': _comics,
            }),
      },
      {
        'name': 'Notification',
        'icon': Icons.notifications,
        'onPressed': () => Navigator.pushNamed(context, NOTIFICATION),
      },
      {
        'name': 'History',
        'icon': Icons.history,
        'onPressed': () =>
            MyAppNotification.showToast(content: 'History page not exist yet!'),
      },
    ];

    Widget pageView() => MyAppAutoPageView(
          height: bannerHeith,
          pages: List.generate(
            _banners.length,
            (index) => InkWell(
              onTap: () {
                Navigator.pushNamed(context, LIST_CHAPTER,
                    arguments: {'id': _banners[index].id});
              },
              child: MyAppImage(
                _banners[index].image,
                width: MediaQuery.of(context).size.width,
              ),
            ),
          ),
        );

    Widget button() {
      return Column(
        children: [
          SizedBox(height: bannerHeith - 30.0),
          Material(
            color: MyAppColors.transparent,
            child: SizedBox(
              height: 60.0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  listButton.length,
                  (index) => MyAppDiamondButton(
                    onPressed: listButton[index]['onPressed'],
                    icon: listButton[index]['icon'],
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }

    return MyAppListView(
      startWidget: Stack(
        children: [
          pageView(),
          button(),
        ],
      ),
      itemWidget: (comic) => MyAppItemComic(
        context: context,
        comic: comic,
        authenKey: Get.put(AppController()).authenKey.value,
        setState: () => setState(() {}),
      ),
      itemsList: _comics,
    );
  }
}
