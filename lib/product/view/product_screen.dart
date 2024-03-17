import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class ProductScreen extends StatelessWidget {
  static String get routeName => "product";

  const ProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '홈'),
      child: CustomScrollView(
        slivers: [
          SliverToBoxAdapter(
            child: Image.asset(
              'asset/img/category/banner.png',
              fit: BoxFit.contain,
            ),
          ),
          renderCategories(),
          SliverToBoxAdapter(
              child: Container(height: 10.0, color: MyColor.lightGrey))
        ],
      ),
    );
  }

  SliverPadding renderCategories() {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(vertical: 24.0),
      sliver: SliverToBoxAdapter(
        child: SizedBox(
          height: 84.0,
          child: ListView.separated(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(
              horizontal: 24.0,
            ),
            itemCount: 6,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  children: [
                    Container(
                      width: 48.0,
                      decoration: BoxDecoration(
                        color: MyColor.lightGrey,
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: Image.asset(
                          'asset/img/category/category_$index.png',
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 4.0),
                    Text(
                      getCategoryTitle(index: index),
                      style: MyTextStyle.descriptionRegular.copyWith(
                        color: MyColor.darkGrey,
                      ),
                    ),
                  ],
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 8.0);
            },
          ),
        ),
      ),
    );
  }

  String getCategoryTitle({
    required int index,
  }) {
    switch (index) {
      case 0:
        return '특산품';
      case 1:
        return '농산물';
      case 2:
        return '수산물';
      case 3:
        return '축산물';
      case 4:
        return '건강식';
      case 5:
        return '간편식';
      default:
        return '';
    }
  }
}
