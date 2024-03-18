import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/cart/provider/cart_provider.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/product/component/vertical_item_card.dart';
import 'package:jeju_shopping/product/view/product_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CartScreen extends ConsumerWidget {
  static String get routeName => 'cart';

  const CartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final carts = ref.watch(cartProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '장바구니'),
      child: carts.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 24.0),
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
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      final cart = carts[index];
                      return Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .updateSelected(
                                        id: cart.id,
                                        isSelected: !cart.isSelected,
                                      );
                                },
                                icon: cart.isSelected
                                    ? PhosphorIcon(
                                        PhosphorIcons.checkCircle(
                                            PhosphorIconsStyle.fill),
                                        color: MyColor.primary,
                                      )
                                    : PhosphorIcon(PhosphorIcons.circle()),
                              ),
                              IconButton(
                                onPressed: () {
                                  ref
                                      .read(cartProvider.notifier)
                                      .removeProduct(id: cart.id);
                                },
                                icon: PhosphorIcon(PhosphorIcons.x()),
                              ),
                            ],
                          ),
                          VerticalItemListCard(
                            product: cart.productModel,
                            amount: cart.amount,
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider(height: 40.0);
                    },
                    itemCount: carts.length,
                  ),
                )
              ],
            )
          : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                PhosphorIcon(
                  PhosphorIcons.shoppingCart(),
                  size: 60.0,
                ),
                const SizedBox(height: 8.0),
                const Text(
                  '장바구니에\n담긴 상품이 없습니다.',
                  style: MyTextStyle.bodyTitleRegular,
                  textAlign: TextAlign.center,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24.0,
                  ),
                  child: PrimaryButton(
                    onPressed: () {
                      context.goNamed(ProductScreen.routeName);
                    },
                    child: const Text('흠으로 이동'),
                  ),
                )
              ],
            ),
    );
  }
}
