import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class SearchScreen extends StatelessWidget {
  static String get routeName => 'search';

  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: DefaultAppBar(title: '검색'),
      child: Column(
        children: [],
      ),
    );
  }
}
