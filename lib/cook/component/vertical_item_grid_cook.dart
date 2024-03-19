import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/cook/model/cook_model.dart';
import 'package:jeju_shopping/cook/view/cook_detail_screen.dart';

class VerticalItemListCook extends StatelessWidget {
  final List<CookModel> cooks;

  const VerticalItemListCook({
    super.key,
    required this.cooks,
  });

  @override
  Widget build(BuildContext context) {
    const double itemSpacing = 16.0;
    const double horizontalPadding = 24.0;
    final double itemWidth = (MediaQuery.of(context).size.width -
            (horizontalPadding * 2) -
            itemSpacing) /
        2;

    return GridView.builder(
      padding: const EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: horizontalPadding,
      ),
      physics: const BouncingScrollPhysics(),
      shrinkWrap: true,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 16,
        crossAxisSpacing: 16,
        childAspectRatio: itemWidth / (itemWidth + 64), // / 1,
      ),
      itemCount: cooks.length,
      itemBuilder: (context, index) {
        final cook = cooks[index];

        return GestureDetector(
          onTap: () {
            context.goNamed(
              CookDetailScreen.routeName,
              pathParameters: {'id': cook.id},
            );
          },
          child: SizedBox(
            width: itemWidth,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Image.asset(
                  cook.mainImageUrl,
                  fit: BoxFit.cover,
                  height: itemWidth,
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
    );
  }
}
