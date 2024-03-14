import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class MyPageScreen extends StatelessWidget {
  static String get routeName => "my_page";

  const MyPageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      child: const Placeholder(),
    );
  }
}
