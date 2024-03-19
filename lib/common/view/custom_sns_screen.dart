import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/product/view/product_screen.dart';

class CustomSnsScreen extends StatefulWidget {
  static String get routeName => 'sns';

  const CustomSnsScreen({super.key});

  @override
  State<CustomSnsScreen> createState() => _CustomSnsScreenState();
}

class _CustomSnsScreenState extends State<CustomSnsScreen> {
  @override
  void initState() {
    super.initState();

    delay();
  }

  @override
  Widget build(BuildContext context) {
    final title = GoRouterState.of(context).pathParameters['title'];
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
              child: Image.asset(
            'asset/img/login/$title.png',
            fit: BoxFit.fitHeight,
          )),
        ],
      ),
    );
  }

  void delay() async {
    await Future.delayed(const Duration(seconds: 1));
    context.goNamed(ProductScreen.routeName);
  }
}
