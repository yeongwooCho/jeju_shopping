import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/user/view/login_screen.dart';

class SplashScreen extends StatefulWidget {
  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    delay();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'asset/img/logo/logo.png',
              width: MediaQuery.of(context).size.width * 2 / 3,
            ),
            const SizedBox(height: 16.0),
            Image.asset(
              'asset/img/logo/name.png',
              width: MediaQuery.of(context).size.width * 2 / 3,
            ),
          ],
        ),
      ),
    );
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 1));

    context.goNamed(LoginScreen.routeName);
  }
}
