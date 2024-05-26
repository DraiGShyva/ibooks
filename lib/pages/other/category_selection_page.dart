import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_item_comic.dart';
import 'package:myapp/components/my_app_text.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/models/comic_model.dart';

class CategorySelectionPage extends StatefulWidget {
  const CategorySelectionPage({super.key, required this.items});

  final List<Comic> items;

  @override
  State<CategorySelectionPage> createState() => _CategorySelectionPageState();
}

class _CategorySelectionPageState extends State<CategorySelectionPage> {
  late List<String> allCategories;
  List<String> selectedCategories = [];
  List<Comic> filteredComics = [];

  @override
  void initState() {
    super.initState();
    allCategories = widget.items
        .expand((comic) => comic.category!)
        .toSet()
        .toList()
      ..sort();
    _filterStories();
  }

  void _filterStories() {
    setState(() {
      if (selectedCategories.isEmpty) {
        filteredComics = [];
      } else {
        filteredComics = widget.items.where((comic) {
          return selectedCategories.every((category) {
            return comic.category!.contains(category);
          });
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var wrap = Padding(
      padding: const EdgeInsets.all(8.0),
      child: Wrap(
          spacing: 8.0,
          children: allCategories.map((category) {
            return FilterChip(
              label: Text(category),
              selected: selectedCategories.contains(category),
              onSelected: (selected) {
                setState(() {
                  if (selected) {
                    selectedCategories.add(category);
                  } else {
                    selectedCategories.remove(category);
                  }
                  _filterStories();
                });
              },
            );
          }).toList()),
    );

    return Scaffold(
      appBar: AppBar(
        title: const MyAppText('Select Category'),
        centerTitle: true,
      ),
      body: Column(
        children: selectedCategories.isNotEmpty
            ? [
                Container(
                  height: 200.0,
                  decoration: BoxDecoration(
                    color: Get.theme.primaryColor.withOpacity(0.1),
                  ),
                  child: SingleChildScrollView(
                    child: wrap,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      selectedCategories.clear();
                      _filterStories();
                    });
                  },
                  child: const Text('Xóa tất cả'),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: filteredComics.length,
                    itemBuilder: (context, index) {
                      return MyAppItemComic(
                        context: context,
                        comic: filteredComics[index],
                        authenKey: Get.put(AppController()).authenKey.value,
                        setState: () => setState(() {}),
                      );
                    },
                  ),
                ),
              ]
            : [wrap],
      ),
    );
  }
}
