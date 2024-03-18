import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/view/product_detail_screen.dart';

class HorizontalItemList extends StatelessWidget {
  final List<ProductModel> products;

  const HorizontalItemList({
    super.key,
    required this.products,
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
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];

          return GestureDetector(
            onTap: () {
              context.goNamed(
                ProductDetailScreen.routeName,
                pathParameters: {'id': product.id},
              );
            },
            child: SizedBox(
              width: 140.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Image.asset(
                    product.mainImageUrl,
                    fit: BoxFit.cover,
                    height: 140.0,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    product.name,
                    style: MyTextStyle.descriptionRegular,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4.0),
                  Text(
                    DataUtils.convertPriceToMoneyString(price: product.price),
                    style: MyTextStyle.bodyBold,
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
