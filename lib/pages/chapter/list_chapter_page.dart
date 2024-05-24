import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/controller/chapter_controller.dart';
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
          title: const Text('Chapters'),
          centerTitle: true,
          backgroundColor: Colors.blue,
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
          backgroundColor: Colors.blue,
        ),
        body: const Center(
          child: Text('Chapter not found!'),
        ),
      );
    }
  }
}
