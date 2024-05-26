import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_list_view.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/chapter_controller.dart';
import 'package:myapp/utils/colors.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key, required this.id, required this.chapNumber});

  final String id;
  final String chapNumber;

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

double _appBarOpacity = 1.0;

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    final chapterController = Get.put(ChapterController());
    final chapter = chapterController.getChapter(widget.id, widget.chapNumber);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: _appBarOpacity,
          child: AppBar(
            title: MyAppText('Chapter ${chapter.chapNumber}'),
            centerTitle: true,
            backgroundColor: MyAppColors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: MyAppListView(
        currentMax: 20,
        loadMoreItem: 20,
        itemsList: List.generate(
            chapter.images.length, (index) => chapter.images[index]),
        itemWidget: (item) => MyAppImage(item),
        onScrollDown: () {
          setState(() {
            _appBarOpacity = 0.0;
          });
        },
        onScrollUp: () {
          setState(() {
            _appBarOpacity = 1.0;
          });
        },
      ),
    );
  }
}
