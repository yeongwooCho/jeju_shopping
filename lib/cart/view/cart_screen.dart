import 'package:collection/collection.dart';
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

class CartScreen extends ConsumerStatefulWidget {
  static String get routeName => 'cart';

  const CartScreen({super.key});

  @override
  ConsumerState<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends ConsumerState<CartScreen> {
  @override
  Widget build(BuildContext context) {
    final carts = ref.watch(cartProvider);
    final isAllSelected =
        carts.firstWhereOrNull((element) => !element.isSelected) == null;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '장바구니'),
      child: carts.isNotEmpty
          ? Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 20.0,
                    horizontal: 24.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartProvider.notifier)
                              .updateAllSelected(isSelected: !isAllSelected);
                        },
                        child: Row(
                          children: [
                            (isAllSelected)
                                ? PhosphorIcon(
                                    PhosphorIcons.checkCircle(
                                      PhosphorIconsStyle.fill,
                                    ),
                                    color: MyColor.primary,
                                  )
                                : PhosphorIcon(
                                    PhosphorIcons.circle(
                                      PhosphorIconsStyle.bold,
                                    ),
                                    color: MyColor.text,
                                  ),
                            const SizedBox(width: 8.0),
                            const Text(
                              '전체 선택',
                              style: MyTextStyle.bodyBold,
                            ),
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          ref
                              .read(cartProvider.notifier)
                              .removeAllSelectedProduct();
                        },
                        child: const Text(
                          '선택 삭제',
                          style: MyTextStyle.bodyBold,
                        ),
                      ),
                    ],
                  ),
                ),
                const DividerContainer(),
                Expanded(
                  child: ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    itemBuilder: (_, index) {
                      final cart = carts[index];
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 24.0,
                              right: 24.0,
                              bottom: 8.0,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(cartProvider.notifier)
                                        .updateSelected(
                                          cartId: cart.id,
                                          isSelected: !cart.isSelected,
                                        );
                                  },
                                  child: cart.isSelected
                                      ? PhosphorIcon(
                                          PhosphorIcons.checkCircle(
                                              PhosphorIconsStyle.fill),
                                          color: MyColor.primary,
                                        )
                                      : PhosphorIcon(PhosphorIcons.circle()),
                                ),
                                InkWell(
                                  onTap: () {
                                    print(cart.id);
                                    ref
                                        .read(cartProvider.notifier)
                                        .removeProduct(id: cart.id);
                                  },
                                  child: PhosphorIcon(PhosphorIcons.x()),
                                ),
                              ],
                            ),
                          ),
                          VerticalItemListCard(
                            product: cart.productModel,
                            amount: cart.amount,
                            amountUpdateButton: InkWell(
                              onTap: () {},
                              child: Container(
                                color: MyColor.primary,
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    '갯수 변경',
                                    style: MyTextStyle.minimumRegular.copyWith(
                                      color: MyColor.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 24.0),
                        child: Divider(height: 40.0),
                      );
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
