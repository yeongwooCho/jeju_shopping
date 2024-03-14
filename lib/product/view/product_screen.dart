import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class ProductScreen extends StatelessWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(child: const Placeholder());
  }
}
