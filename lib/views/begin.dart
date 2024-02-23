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
  clearPass();
}

clearPass() {
  _password.clear();
  _rePassword.clear();
}

TextEditingController _email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _rePassword = TextEditingController();

var _login = container(Login(email: _email, password: _password));
var _register = container(
    Register(email: _email, password: _password, rePassword: _rePassword));
var _forgotPassword = container(ForgotPassword(email: _email));

Widget container(Widget child) => Container(
      width: 300,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
        border: Border.fromBorderSide(
          BorderSide(
            color: Color.fromARGB(64, 0, 0, 0),
            width: 1.0,
          ),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black,
            blurRadius: 10,
          ),
        ],
      ),
      padding: const EdgeInsetsDirectional.all(20.0),
      child: child,
    );

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
