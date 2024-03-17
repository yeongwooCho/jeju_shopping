import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RootTab extends StatelessWidget {
  static String get routeName => "root";

  final Widget child;

  const RootTab({
    super.key,
    required this.child,
  });

  int getIndex(BuildContext context) {
    if (GoRouterState.of(context).location == '/product') {
      return 0;
    } else if (GoRouterState.of(context).location == '/cook') {
      return 1;
    } else {
      return 2;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(GoRouterState.of(context).location),
      ),
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: (int index) {
          if (index == 0) {
            context.go('/product');
          } else if (index == 1) {
            context.go('/cook');
          } else {
            context.go('/my_page');
          }
        },
        currentIndex: getIndex(context),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'person',
          ),
        ],
      ),
    );
  }
}
