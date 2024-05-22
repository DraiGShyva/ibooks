import 'package:flutter/material.dart';

class MyAppListView extends StatefulWidget {
  /// The data used to generate the items in the list.
  ///
  /// Example:
  /// ```dart
  /// List.generate(20, (index) => 'Index $index');
  /// ```

  /// A function that builds a widget for each item in the list.
  ///
  /// It receives the `index` of the current item and returns a widget.
  ///
  /// Example:
  /// ```dart
  /// (index) => Column(
  ///   children: [
  ///     Text('Index $index'),
  ///     const SizedBox(height: 100.0),
  ///     const Divider(),
  ///   ],
  /// )
  /// ```

  const MyAppListView({
    super.key,
    this.startWidget = const SizedBox(),
    required this.itemWidget,
    required this.itemsList,
    this.currentMax = 10,
    this.loadMoreItem = 5,
    this.onScrollDown,
    this.onScrollUp,
  });

  final Widget startWidget;
  final Widget Function(dynamic) itemWidget;
  final List<dynamic> itemsList;
  final int currentMax;
  final int loadMoreItem;
  final void Function()? onScrollDown;
  final void Function()? onScrollUp;

  @override
  State<MyAppListView> createState() => _MyAppListViewState();
}

class _MyAppListViewState extends State<MyAppListView> {
  final ScrollController _scrollController = ScrollController();
  late int _currentMax;
  late int _loadMoreItem;
  double _currentPixel = 0.0;
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();

    _scrollController.addListener(
      () {
        if (_scrollController.position.pixels * 1.5 >
            _scrollController.position.maxScrollExtent) {
          _loadMore();
        }
      },
    );

    _currentMax = widget.currentMax >= widget.itemsList.length
        ? widget.itemsList.length
        : widget.currentMax;

    _loadMoreItem = widget.loadMoreItem;
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: onScroll,
      child: listView(),
    );
  }

  void _loadMore() {
    if (!_isLoading && _currentMax < widget.itemsList.length) {
      setState(() {
        _isLoading = true;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            if (_currentMax + _loadMoreItem >= widget.itemsList.length) {
              _currentMax = widget.itemsList.length;
            } else {
              _currentMax += _loadMoreItem;
            }
            _isLoading = false;
          });
        });
      });
    }
  }

  ListView listView() {
    return ListView.builder(
      controller: _scrollController,
      itemCount: _currentMax + (_isLoading ? 1 : 0),
      itemBuilder: (context, index) {
        if (index == _currentMax) {
          return const Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                CircularProgressIndicator(),
              ],
            ),
          );
        }
        final widgetItem = widget.itemWidget(widget.itemsList[index]);
        if (index == 0) {
          return Column(
            children: [
              widget.startWidget,
              widgetItem,
            ],
          );
        }
        return widgetItem;
      },
    );
  }

  bool onScroll(ScrollNotification scrollInfo) {
    if (scrollInfo.metrics.pixels * 1.5 > scrollInfo.metrics.maxScrollExtent &&
        !_isLoading &&
        _currentMax < widget.itemsList.length) {
      _loadMore();
    }
    if (_currentPixel > scrollInfo.metrics.pixels) {
      widget.onScrollUp?.call();
      _currentPixel = scrollInfo.metrics.pixels;
    } else if (_currentPixel < scrollInfo.metrics.pixels) {
      widget.onScrollDown?.call();
      _currentPixel = scrollInfo.metrics.pixels;
    }
    return true;
  }
}
