import 'package:flutter/material.dart';

class MyAppListView extends StatefulWidget {
  const MyAppListView({
    super.key,
    this.otherWidget = const SizedBox(),
    required this.itemsData,
    required this.itemWidget,
    this.currentMax = 10,
    this.loadMoreItem = 5,
    this.onScrollDown,
    this.onScrollUp,
  });

  final Widget otherWidget;
  final List<dynamic> itemsData;
  final Widget Function(dynamic) itemWidget;
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
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    _currentMax = widget.currentMax >= widget.itemsData.length
        ? widget.itemsData.length
        : widget.currentMax;
    _loadMoreItem = widget.loadMoreItem;
    _scrollController.addListener(() {
      if (_scrollController.position.pixels * 1.5 >
          _scrollController.position.maxScrollExtent) {
        _loadMore();
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _loadMore() {
    if (!_isLoading && _currentMax < widget.itemsData.length) {
      setState(() {
        _isLoading = true;
        Future.delayed(const Duration(seconds: 1), () {
          setState(() {
            if (_currentMax + _loadMoreItem >= widget.itemsData.length) {
              _currentMax = widget.itemsData.length;
            } else {
              _currentMax += _loadMoreItem;
            }
            _isLoading = false;
          });
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollInfo) {
        if (scrollInfo.metrics.pixels * 1.5 >
                scrollInfo.metrics.maxScrollExtent &&
            !_isLoading &&
            _currentMax < widget.itemsData.length) {
          _loadMore();
        }
        if (scrollInfo.metrics.axisDirection == AxisDirection.down) {
          print('Scroll Down');
          widget.onScrollDown?.call();
        } else if (scrollInfo.metrics.axisDirection == AxisDirection.up) {
          print('Scroll Up');
          widget.onScrollUp?.call();
        }
        return true;
      },
      child: ListView.builder(
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
          final item = widget.itemsData[index];
          if (index == 0) {
            return Column(
              children: [
                widget.otherWidget,
                widget.itemWidget(item),
              ],
            );
          }
          return widget.itemWidget(item);
        },
      ),
    );
  }
}
