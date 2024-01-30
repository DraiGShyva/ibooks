import 'package:flutter/material.dart';
import 'package:myapp/views/forgot_password.dart';
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
        const MiniPage(),
      ],
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
    switch (beginPage.value) {
      case "/loginToRegister":
        {
          return Stack(
            children: [
              _pushOut(_login, context),
              _pushIn(_register, context),
            ],
          );
        }
      case "/loginToForgotPassword":
        return Stack(
          children: [
            _pushOut(_login, context),
            _pushIn(_forgotPassword, context),
          ],
        );
      case "/registerToLogin":
        return Stack(
          children: [
            _pushOut(_register, context),
            _pushIn(_login, context),
          ],
        );
      case "/forgotPasswordToLogin":
        return Stack(
          children: [
            _pushOut(_forgotPassword, context),
            _pushIn(_login, context),
          ],
        );
      default:
        return _login;
    }
  }
}

ValueNotifier<String> beginPage = ValueNotifier<String>('');

clearEmail() {
  _email.clear();
}

clearPass() {
  _password.clear();
  _rePassword.clear();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _rePassword = TextEditingController();

var _login = Login(email: _email, password: _password);
var _register =
    Register(email: _email, password: _password, rePassword: _rePassword);
var _forgotPassword = ForgotPassword(email: _email);

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
