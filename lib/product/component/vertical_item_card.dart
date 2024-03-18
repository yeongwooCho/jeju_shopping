import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/order/model/order_model.dart';
import 'package:jeju_shopping/product/model/product_model.dart';

class VerticalItemListCard extends ConsumerWidget {
  final ProductModel product;
  final int amount;
  final Widget? amountUpdateButton;

  const VerticalItemListCard({
    super.key,
    required this.product,
    required this.amount,
    this.amountUpdateButton,
  });

  factory VerticalItemListCard.fromModel({
    required OrderModel order,
  }) {
    return VerticalItemListCard(
      product: order.productModel,
      amount: order.amount,
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0),
      child: Row(
        children: [
          Image.asset(
            product.imageUrl,
            fit: BoxFit.cover,
            width: 100.0,
            height: 100.0,
          ),
          const SizedBox(width: 12.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  product.name,
                  style: MyTextStyle.descriptionRegular,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 8.0),
                Row(
                  children: [
                    Text(
                      '갯수: $amount개',
                      style: MyTextStyle.descriptionRegular,
                    ),
                    const SizedBox(width: 12.0),
                    if (amountUpdateButton != null) amountUpdateButton!,
                  ],
                ),
                const SizedBox(height: 8.0),
                Text(
                  '${DataUtils.convertPriceToMoneyString(price: product.price * amount)}원',
                  style: MyTextStyle.bodyBold,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
