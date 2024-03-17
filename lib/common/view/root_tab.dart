import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

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
      body: child,
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0.0,
        backgroundColor: MyColor.white,
        selectedItemColor: MyColor.text,
        selectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        unselectedItemColor: MyColor.middleGrey,
        unselectedFontSize: 12.0,
        unselectedLabelStyle: MyTextStyle.bodyBold.copyWith(fontSize: 12.0),
        currentIndex: getIndex(context),
        onTap: (int index) {
          if (index == 0) {
            context.go('/product');
          } else if (index == 1) {
            context.go('/cook');
          } else {
            context.go('/my_page');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.house(),
              size: 30.0,
            ),
            label: '홈',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.cookingPot(),
              size: 30.0,
            ),
            label: '웰빙쿡',
          ),
          BottomNavigationBarItem(
            icon: PhosphorIcon(
              PhosphorIcons.user(),
              size: 30.0,
            ),
            label: '내정보',
          ),
        ],
      ),
    );
  }
}
