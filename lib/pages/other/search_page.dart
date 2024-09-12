import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp/components/my_app_item_comic.dart';
import 'package:myapp/controller/app_controller.dart';
import 'package:myapp/models/comic_model.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({
    super.key,
    required this.searchItem,
  });

  final List<Comic> searchItem;

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final TextEditingController _searchController = TextEditingController();
  List<Comic> _searchResults = [];

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_onSearchTextChanged);
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchTextChanged() {
    setState(() {
      _searchResults = _performSearch(_searchController.text);
    });
  }

  List<Comic> _performSearch(String query) {
    if (query.isEmpty) {
      return [];
    } else {
      return widget.searchItem
          .where((item) =>
              item.title?.toLowerCase().contains(query.toLowerCase()) ?? false)
          .toList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(
          controller: _searchController,
          decoration: const InputDecoration(
            hintText: 'Tìm kiếm...',
            prefixIcon: Icon(Icons.search),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: _searchResults.length,
        itemBuilder: (context, index) {
          return MyAppItemComic(
            context: context,
            comic: _searchResults[index],
            authenKey: Get.put(AppController()).authenKey.value,
            setState: () => setState(() {}),
          );
        },
      ),
    );
  }
}
