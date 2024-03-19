import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';
import 'package:jeju_shopping/product/view/product_detail_screen.dart';

class HorizontalItemListCook extends StatelessWidget {
  final List<CookModel> cooks;

  const HorizontalItemListCook({
    super.key,
    required this.cooks,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 214.0,
      child: ListView.separated(
        physics: const BouncingScrollPhysics(),
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(
          horizontal: 24.0,
        ),
        itemCount: cooks.length,
        itemBuilder: (context, index) {
          final cook = cooks[index];

          return GestureDetector(
            onTap: () {
              context.goNamed(
                ProductDetailScreen.routeName,
                pathParameters: {'id': cook.id},
              );
            },
            child: SizedBox(
              width: 140.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    cook.mainImageUrl,
                    fit: BoxFit.cover,
                    height: 140.0,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    cook.name,
                    style: MyTextStyle.descriptionRegular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(width: 16.0);
        },
      ),
    );
  }
}
