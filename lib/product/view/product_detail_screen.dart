import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/product/model/product_model.dart';
import 'package:jeju_shopping/product/provider/product_provider.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProductDetailScreen extends ConsumerWidget {
  static String get routeName => 'product_detail';

  const ProductDetailScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productId = GoRouterState.of(context).pathParameters['id'];

    final product = ref
        .watch(productProvider)
        .firstWhere((element) => element.id == productId);

    final fullWidth = MediaQuery.of(context).size.width;

    return DefaultLayout(
      appbar: const DefaultAppBar(title: ''),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              'asset/img/product/product_1.jpg',
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
                style: MyTextStyle.productTitle,
              ),
            ),
            Image.asset(
              'asset/img/product/product_1.jpg',
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.cover,
            ),
            Image.asset(
              'asset/img/product/product_1.jpg',
              width: fullWidth,
              height: fullWidth,
              fit: BoxFit.cover,
            ),
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
            style: MyTextStyle.productTitle,
          ),
          const SizedBox(height: 12.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${DataUtils.convertPriceToMoneyString(price: product.price)}원',
                style: MyTextStyle.productTitle,
              ),
              IconButton(
                onPressed: () {},
                icon: PhosphorIcon(
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
