import 'package:flutter/material.dart';
import 'package:myapp/views/auth/forgot_password.dart';
import 'package:myapp/views/auth/login.dart';
import 'package:myapp/views/auth/register.dart';

// router name: /begin
class Begin extends StatelessWidget {
  const Begin({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
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
          const Material(
            color: Colors.transparent,
            child: Center(
              child: SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                  child: MiniPage(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class MiniPage extends StatefulWidget {
  const MiniPage({super.key});

  @override
  State<MiniPage> createState() => _MiniPageState();
}

class _MiniPageState extends State<MiniPage> {
  @override
  void initState() {
    super.initState();
    beginPageListener.addListener(_rebuildPage);
  }

  @override
  void dispose() {
    beginPageListener.removeListener(_rebuildPage);
    super.dispose();
  }

  void _rebuildPage() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    switch (beginPageListener.value) {
      case "/loginToRegister":
        {
          return Stack(
            children: [
              _pushOut(Login(), context),
              _pushIn(Register(), context),
            ],
          );
        }
      case "/loginToForgotPassword":
        return Stack(
          children: [
            _pushOut(Login(), context),
            _pushIn(ForgotPassword(), context),
          ],
        );
      case "/registerToLogin":
        return Stack(
          children: [
            _pushOut(Register(), context),
            _pushIn(Login(), context),
          ],
        );
      case "/forgotPasswordToLogin":
        return Stack(
          children: [
            _pushOut(ForgotPassword(), context),
            _pushIn(Login(), context),
          ],
        );
      default:
        return Login();
    }
  }
}

ValueNotifier<String> beginPageListener = ValueNotifier<String>('');

_pushIn(Widget child, BuildContext context) => SlideTransition(
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

_pushOut(Widget child, BuildContext context) => ScaleTransition(
      scale: Tween<double>(
        begin: 1.0,
        end: 0.0,
      ).animate(
        AnimationController(
          vsync: Navigator.of(context),
          duration: const Duration(milliseconds: 1000),
        )..forward(),
      ),
      child: child,
    );
