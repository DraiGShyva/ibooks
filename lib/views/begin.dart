import 'package:flutter/material.dart';
import 'package:myapp/views/login.dart';
import 'package:myapp/views/register.dart';

// router name: /begin
class Begin extends StatelessWidget {
  const Begin({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 235, 241, 255),
            image: DecorationImage(
              image: AssetImage('assets/images/log/background.jpg'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Page(),
      ],
    );
  }
}

ValueNotifier<String> beginPage = ValueNotifier<String>('');

class Page extends StatefulWidget {
  const Page({super.key});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  void initState() {
    super.initState();
    beginPage.addListener(_rebuildPage);
  }

  @override
  void dispose() {
    beginPage.removeListener(_rebuildPage);
    super.dispose();
  }

  void _rebuildPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController username = TextEditingController();
    TextEditingController password = TextEditingController();
    TextEditingController email = TextEditingController();
    TextEditingController rePassword = TextEditingController();

    pushOut(child) => SlideTransition(
          position: Tween<Offset>(
            begin: Offset.zero,
            end: const Offset(0.0, 1.0),
          ).animate(
            AnimationController(
              vsync: Navigator.of(context),
              duration: const Duration(milliseconds: 1000),
            )..forward(),
          ),
          child: child,
        );

    pushIn(child) => SlideTransition(
          position: Tween<Offset>(
            begin: const Offset(1.0, 0.0),
            end: Offset.zero,
          ).animate(
            AnimationController(
              vsync: Navigator.of(context),
              duration: const Duration(milliseconds: 1000),
            )..forward(),
          ),
          child: child,
        );

    switch (beginPage.value) {
      case "/registerToLogin":
        return Stack(
          children: [
            pushOut(Register(
                email: email,
                username: username,
                password: password,
                rePassword: rePassword)),
            pushIn(Login(username: username, password: password)),
          ],
        );
      case "/loginToRegister":
        return Stack(
          children: [
            pushOut(Login(username: username, password: password)),
            pushIn(Register(
                email: email,
                username: username,
                password: password,
                rePassword: rePassword)),
          ],
        );
      default:
        return Login(username: username, password: password);
    }
  }
}
