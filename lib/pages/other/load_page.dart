import 'package:flutter/material.dart';
import 'package:myapp/utils/route.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({
    super.key,
    this.nextPage = LOGIN,
  });

  final String nextPage;

  @override
  State<LoadPage> createState() => _LoadPageState();

  static Widget? _nextClass;

  static widget({required Widget next}) {
    _nextClass = next;
    return const LoadPage();
  }
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 1), () {
      if (LoadPage._nextClass != null) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoadPage._nextClass!),
          (route) => false,
        );
      } else {
        Navigator.pushNamedAndRemoveUntil(
          context,
          widget.nextPage,
          (route) => false,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
