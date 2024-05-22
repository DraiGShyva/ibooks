import 'package:flutter/material.dart';
import 'package:myapp/controller/chapter_controller.dart';
import 'package:myapp/utils/route.dart';

class ListChapterPage extends StatefulWidget {
  const ListChapterPage({super.key, required this.id});

  final String id;

  @override
  State<ListChapterPage> createState() => _ListChapterPageState();
}

class _ListChapterPageState extends State<ListChapterPage> {
  @override
  void initState() {
    super.initState();
    ChapterController.init();
  }

  @override
  Widget build(BuildContext context) {
    try {
      var chapters = ChapterController.chapters
          .firstWhere((element) => element.id == widget.id)
          .chapters;
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
                      'id': widget.id,
                      'chapNumber': chapters[index].chapNumber,
                    });
                  },
                ),
                const Divider(),
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
