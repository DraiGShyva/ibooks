import 'package:flutter/material.dart';
import 'package:myapp/data/chapter_data.dart';
import 'package:myapp/my_app.dart';

class ChapterListPage extends StatefulWidget {
  const ChapterListPage({super.key, required this.id});

  final String id;

  @override
  State<ChapterListPage> createState() => _ChapterListPageState();
}

class _ChapterListPageState extends State<ChapterListPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    try {
      var chapters = ChapterData.chapters
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
                  title: Text('Chapter ${index + 1}'),
                  onTap: () {
                    Navigator.pushNamed(context, MyApp.CHAPTER, arguments: {
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
