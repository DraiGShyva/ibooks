import 'package:flutter/material.dart';

import 'forgot_password_page.dart';
import 'login_page.dart';
import 'register_page.dart';

// router name: /begin
class BeginPage extends StatelessWidget {
  const BeginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              color: Colors.transparent,
            ),
          ),
          const Center(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.only(top: 20.0, bottom: 20.0),
                child: MiniPage(),
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
      case '/login':
        return customScaleTransition(LoginPage(), context);
      case '/register':
        return customScaleTransition(RegisterPage(), context);
      case '/forgot-password':
        return customScaleTransition(ForgotPasswordPage(), context);
      default:
        return LoginPage();
    }
  }
}

ValueNotifier<String> beginPageListener = ValueNotifier<String>('');

customScaleTransition(Widget child, BuildContext context) => ScaleTransition(
      scale: Tween<double>(
        begin: 0.0,
        end: 1.0,
      ).animate(AnimationController(
        vsync: Navigator.of(context),
        duration: const Duration(milliseconds: 500),
      )..forward()),
      child: child,
    );
