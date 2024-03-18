import 'package:badges/badges.dart' as badges;
import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:hidable/hidable.dart';
import 'package:jeju_shopping/cart/provider/cart_provider.dart';
import 'package:jeju_shopping/cart/view/cart_screen.dart';
import 'package:jeju_shopping/common/component/custom_toast.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/order/view/order_screen.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';
import 'package:jeju_shopping/product/view/search_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductDetailScreen extends ConsumerStatefulWidget {
  static String get routeName => 'product_detail';

  const ProductDetailScreen({super.key});

  @override
  ConsumerState<ProductDetailScreen> createState() =>
      _ProductDetailScreenState();
}

class _ProductDetailScreenState extends ConsumerState<ProductDetailScreen> {
  final ScrollController scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final productId = GoRouterState.of(context).pathParameters['id'];

    final product = ref
        .watch(productProvider)
        .firstWhere((element) => element.id == productId);

    final carts = ref.watch(cartProvider);

    final fullWidth = MediaQuery.of(context).size.width;
    final safeTopPadding = MediaQuery.of(context).padding.top;
    final safeBottomPadding = MediaQuery.of(context).padding.bottom;

    return DefaultLayout(
      appbar: Hidable(
        preferredWidgetSize:
            Size.fromHeight(DefaultAppBar.defaultAppBarHeight + safeTopPadding),
        controller: scrollController,
        child: DefaultAppBar(
          title: '',
          action: [
            IconButton(
              onPressed: () {
                context.pushNamed(CartScreen.routeName);
              },
              iconSize: 30.0,
              icon: badges.Badge(
                showBadge: carts.isNotEmpty,
                badgeContent: Text(
                  carts.length.toString(),
                  style: MyTextStyle.minimumRegular.copyWith(
                    color: MyColor.white,
                    height: 1.0,
                  ),
                ),
                child: PhosphorIcon(PhosphorIcons.shoppingCart()),
              ),
            ),
            IconButton(
              onPressed: () {
                context.pushNamed(SearchScreen.routeName);
              },
              iconSize: 30.0,
              icon: PhosphorIcon(PhosphorIcons.magnifyingGlass()),
            ),
            const SizedBox(width: 8.0),
          ],
        ),
      ),
      bottomNavigationBar: Hidable(
        controller: scrollController,
        preferredWidgetSize: const Size.fromHeight(68),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 8.0),
          child: Row(
            children: [
              SecondaryButton(
                onPressed: () {
                  final isNotExistProduct = carts.firstWhereOrNull(
                        (e) => e.productModel.id == productId,
                      ) ==
                      null;

                  if (isNotExistProduct) {
                    ref
                        .read(cartProvider.notifier)
                        .addProduct(product: product, amount: 1);
                  } else {
                    showCustomToast(context, msg: '이미 등록된 상품입니다.');
                  }
                },
                child: const Text('장바구니에 담기'),
              ),
              const SizedBox(width: 12.0),
              Expanded(
                child: PrimaryButton(
                  onPressed: () {
                    context.pushNamed(
                      OrderScreen.routeName,
                      pathParameters: {"id": product.id},
                    );
                  },
                  child: const Text('바로 결제하기'),
                ),
              ),
            ],
          ),
        ),
      ),
      child: SingleChildScrollView(
        controller: scrollController,
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              product.mainImageUrl,
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.cover,
            ),
            renderProductInfo(product: product),
            const DividerContainer(),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 24.0,
                horizontal: 32.0,
              ),
              child: const Text(
                '제품 상세 설명',
                style: MyTextStyle.bigTitleBold,
              ),
            ),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: product.detailImageUrls.length,
              itemBuilder: (context, index) {
                return Image.asset(
                  product.detailImageUrls[index],
                  width: fullWidth,
                  height: fullWidth,
                  fit: BoxFit.cover,
                );
              },
            )
          ],
        ),
      ),
    );
  }

  Widget renderProductInfo({
    required ProductModel product,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            product.name,
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DataUtils.convertPriceToMoneyString(price: product.price)}원',
                style: MyTextStyle.bigTitleBold,
              ),
              IconButton(
                onPressed: () {
                  ref.read(productProvider.notifier).updateLike(
                        productId: product.id,
                        isLike: !product.isLike,
                      );
                },
                icon: product.isLike
                    ? PhosphorIcon(
                        PhosphorIcons.heart(PhosphorIconsStyle.fill),
                        color: MyColor.error,
                        size: 32.0,
                      )
                    : PhosphorIcon(
                        PhosphorIcons.heart(),
                  color: MyColor.middleGrey,
                  size: 32.0,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          Row(
            children: [
              PhosphorIcon(
                PhosphorIcons.truck(),
                color: MyColor.primary,
              ),
              const SizedBox(width: 8.0),
              Text(
                '${DataUtils.convertPriceToMoneyString(price: product.deliveryPrice)}원 (3개마다 기본 배송비 반복 부과)',
                style: MyTextStyle.minimumRegular,
              )
            ],
          ),
        ],
      ),
    );
  }
}
