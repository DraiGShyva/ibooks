import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/chapter_controller.dart';
import 'package:myapp/controller/comic_controller.dart';
import 'package:myapp/utils/colors.dart';
import 'package:myapp/utils/route.dart';

class ListChapterPage extends StatelessWidget {
  const ListChapterPage({super.key, required this.id});

  final String id;

  @override
  Widget build(BuildContext context) {
    try {
      final chapterController = Get.put(ChapterController());
      final chapters = chapterController.getListChapter(id).chapters;
      return Scaffold(
        appBar: AppBar(
          title: MyAppText(
              Get.put(ComicController()).getComic(id).title ?? 'Chapters'),
          centerTitle: true,
          backgroundColor: MyAppColors.blueAccent,
        ),
        body: ListView.builder(
          itemCount: chapters.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                ListTile(
                  title: Text('Chapter ${chapters[index].chapNumber}'),
                  onTap: () {
                    Navigator.pushNamed(context, CHAPTER, arguments: {
                      'id': id,
                      'chapNumber': chapters[index].chapNumber,
                    });
                  },
                ),
                const Divider(height: 0.0),
              ],
            );
          },
        ),
      );
    } catch (e) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Chapters'),
          centerTitle: true,
          backgroundColor: MyAppColors.blueAccent,
        ),
        body: const Center(
          child: Text('Chapter not found!'),
        ),
      );
    }
  }
}
