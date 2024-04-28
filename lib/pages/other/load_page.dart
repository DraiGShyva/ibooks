import 'package:flutter/material.dart';
import 'package:myapp/my_app.dart';

class LoadPage extends StatefulWidget {
  const LoadPage({
    super.key,
    this.nextPage = MyApp.LOGIN,
    this.removeUntil = false,
  });

  final String nextPage;
  final bool removeUntil;

  @override
  State<LoadPage> createState() => _LoadPageState();
}

class _LoadPageState extends State<LoadPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      Navigator.pushNamedAndRemoveUntil(
        context,
        widget.nextPage,
        (route) => !widget.removeUntil,
      );
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
