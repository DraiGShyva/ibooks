import 'package:flutter/material.dart';
import 'package:myapp/components/my_app_image.dart';
import 'package:myapp/components/my_app_list_view.dart';
import 'package:myapp/data/chapter_data.dart';

class ChapterPage extends StatefulWidget {
  const ChapterPage({super.key, required this.id, required this.chapNumber});

  final String id;
  final String chapNumber;

  @override
  State<ChapterPage> createState() => _ChapterPageState();
}

double appBarOpacity = 1.0;

class _ChapterPageState extends State<ChapterPage> {
  @override
  Widget build(BuildContext context) {
    var chapter = ChapterData.chapters
        .firstWhere((element) => element.id == widget.id)
        .chapters
        .firstWhere((element) => element.chapNumber == widget.chapNumber);

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AnimatedOpacity(
          duration: const Duration(milliseconds: 300),
          opacity: appBarOpacity,
          child: AppBar(
            title: Text('Chapter ${chapter.chapNumber}'),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: MyAppListView(
        currentMax: 20,
        loadMoreItem: 20,
        itemsData: List.generate(
            chapter.imageCount, (index) => '${chapter.images}${index + 1}.jpg'),
        itemWidget: (item) => MyAppImage(imageUrl: item),
        onScrollDown: () {
          setState(() {
            appBarOpacity = 0.0;
          });
        },
        onScrollUp: () {
          setState(() {
            appBarOpacity = 1.0;
          });
        },
      ),
    );
  }
}
