import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class SplashScreen extends StatelessWidget {
  static String get routeName => 'splash';

  const SplashScreen({Key? key}) : super(key: key);

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
}
