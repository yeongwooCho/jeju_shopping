import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/cart/provider/cart_provider.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/component/vertical_item_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartScreen extends ConsumerWidget {
  static String get routeName => 'cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '장바구니'),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {},
                  child: Row(
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.circle(PhosphorIconsStyle.bold),
                        color: MyColor.text,
                      ),
                      const SizedBox(width: 8.0),
                      Text(
                        '전체 선택',
                        style: MyTextStyle.bodyBold,
                      ),
                    ],
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    '선택 삭제',
                    style: MyTextStyle.bodyBold,
                  ),
                ),
              ],
            ),
          ),
          DividerContainer(),
          ...carts.map(
            (e) =>
                VerticalItemListCard(product: e.productModel, amount: e.amount),
          ),
        ],
      ),
    );
  }
}
