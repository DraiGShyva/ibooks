import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_auto_page_view.dart';
import 'package:myapp/components/my_app_button_diamond.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_item_comic.dart';
import 'package:myapp/components/my_app_list_view.dart';
import 'package:myapp/controller/banner_controller.dart';
import 'package:myapp/controller/comic_controller.dart';
import 'package:myapp/utils/route.dart';

class HomePage extends StatefulWidget {
  final NotchBottomBarController? controller;

  const HomePage({super.key, this.controller});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _banners = Get.put(BannerController()).banners.value.listBanner;
  final _comics = Get.put(ComicController()).comics.value.listComic;

  @override
  Widget build(BuildContext context) {
    return MyAppListView(
      startWidget: Stack(
        children: [
          _pageView(),
          _listButton(),
        ],
      ),
      itemWidget: (comic) => MyAppItemComic(
        context: context,
        comic: comic,
        setState: () => setState(() {}),
      ),
      itemsList: _comics,
    );
  }

  double bannerHeith = 150.0;

  Widget _pageView() => MyAppAutoPageView(
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

  Widget _listButton() {
    return Column(
      children: [
        SizedBox(height: bannerHeith - 30.0),
        Material(
          color: Colors.transparent,
          child: SizedBox(
            height: 60.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                MyAppDiamondButton(
                  onTap: () {
                    print('Search');
                  },
                  icon: Icons.search,
                ),
                MyAppDiamondButton(
                  onTap: () {
                    print('Category');
                  },
                  icon: Icons.sell_outlined,
                ),
                MyAppDiamondButton(
                  onTap: () {
                    print('Notification');
                  },
                  icon: Icons.notifications,
                ),
                MyAppDiamondButton(
                  onTap: () {
                    print('History');
                  },
                  icon: Icons.history,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
