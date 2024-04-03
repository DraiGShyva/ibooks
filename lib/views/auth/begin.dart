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
        return customScaleTransition(Login(), context);
      case '/register':
        return customScaleTransition(Register(), context);
      case '/forgotPassword':
        return customScaleTransition(ForgotPassword(), context);
      default:
        return Login();
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
