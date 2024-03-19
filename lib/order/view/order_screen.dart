import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/cart/provider/cart_provider.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/component/see_more_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/common/utils/data_utils.dart';
import 'package:jeju_shopping/common/view/completion_screen.dart';
import 'package:jeju_shopping/order/model/order_model.dart';
import 'package:jeju_shopping/order/provider/order_provider.dart';
import 'package:jeju_shopping/product/component/vertical_item_card.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class OrderScreen extends ConsumerWidget {
  static String get routeName => 'order';

  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final orders = ref
        .watch(orderProvider)
        .where((e) => e.deliveryState == DeliveryState.no)
        .toList();
    final totalPrice =
        orders.fold(0, (pre, e) => pre + e.productModel.price * e.amount);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '주문서 작성'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            renderAddress(),
            const DividerContainer(),
            _ProductInfo(orders: orders),
            const DividerContainer(),
            renderPaymentWidget(),
            const DividerContainer(),
            renderPaymentInfoWidget(totalPrice: totalPrice),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: PrimaryButton(
                onPressed: () {
                  context.goNamed(
                    CompletionScreen.routeName,
                    pathParameters: {'title': '결제가\n정상적으로\n완료되었습니다.'},
                  );
                  ref.read(orderProvider.notifier).orderProducts();
                  ref.read(cartProvider.notifier).removeAll();
                },
                child: const Text('결제하기'),
              ),
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }

  Widget renderAddress() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '배송지 정보',
                style: MyTextStyle.bigTitleBold,
              ),
              SeeMoreButton(
                title: '배송지 변경',
                onTap: () {},
              ),
            ],
          ),
          const SizedBox(height: 16.0),
          Text(
            '최지우',
            style: MyTextStyle.descriptionRegular,
          ),
          const SizedBox(height: 4.0),
          Text(
            '010-1234-1234',
            style: MyTextStyle.descriptionRegular,
          ),
          const SizedBox(height: 4.0),
          Text(
            '서울특별시 종로구 세종대로 182',
            style: MyTextStyle.descriptionRegular,
          ),
        ],
      ),
    );
  }

  Widget renderPaymentWidget() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            '결제 방법',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 16.0),
          _TossWidget(),
        ],
      ),
    );
  }

  Widget renderPaymentInfoWidget({
    required int totalPrice,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0, horizontal: 24.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '결제 정보',
            style: MyTextStyle.bigTitleBold,
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                '최종 결제 금액',
                style: MyTextStyle.bodyBold,
              ),
              Text(
                '${DataUtils.convertPriceToMoneyString(price: totalPrice)} 원',
                style: MyTextStyle.bodyBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _ProductInfo extends StatelessWidget {
  final List<OrderModel> orders;

  const _ProductInfo({
    super.key,
    required this.orders,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 40.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            child: Text(
              '상품 정보',
              style: MyTextStyle.bigTitleBold,
            ),
          ),
          const SizedBox(height: 16.0),
          ...orders
              .map(
                (cart) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: VerticalItemListCard(
                    product: cart.productModel,
                    amount: cart.amount,
                  ),
                ),
              )
              .toList()
        ],
      ),
    );
  }
}

class _TossWidget extends StatelessWidget {
  const _TossWidget({super.key});

  @override
  Widget build(BuildContext context) {
    const double horizontal = 24.0;
    const double spacing = 8.0;

    final itemWidth =
        (MediaQuery.of(context).size.width - (horizontal * 2) - (spacing * 2)) /
            3;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Badge(
          alignment: Alignment.topLeft,
          largeSize: 32.0,
          offset: const Offset(-4, -8),
          backgroundColor: MyColor.error,
          textStyle: MyTextStyle.descriptionBold.copyWith(
            color: MyColor.white,
            fontSize: 14.0,
            height: 1,
          ),
          label: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 4.0,
              horizontal: 8.0,
            ),
            child: Text('혜택'),
          ),
          child: InkWell(
            onTap: () {},
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8.0),
                  border: Border.all(
                    color: MyColor.text,
                    width: 2.0,
                  )),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Center(
                  child: Text(
                    '신용 · 체크카드',
                    style: MyTextStyle.bodyBold,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            renderBoxButton(
              itemWidth: itemWidth,
              image: Image.asset('asset/img/pay/naver.png'),
            ),
            const SizedBox(width: 8.0),
            renderBoxButton(
              itemWidth: itemWidth,
              image: Image.asset('asset/img/pay/kakao.png'),
            ),
            const SizedBox(width: 8.0),
            renderBoxButton(
              itemWidth: itemWidth,
              image: Image.asset('asset/img/pay/payco.png'),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Row(
          children: [
            renderBoxButton(
              itemWidth: itemWidth,
              image: Image.asset('asset/img/pay/toss.png'),
            ),
            const SizedBox(width: 8.0),
            renderBoxButton(
              itemWidth: itemWidth,
              image: const Text(
                '가상계좌',
                style: MyTextStyle.descriptionMedium,
              ),
            ),
            const SizedBox(
              width: 8.0,
            ),
            renderBoxButton(
              itemWidth: itemWidth,
              image: const Text(
                '휴대폰',
                style: MyTextStyle.descriptionMedium,
              ),
            ),
          ],
        ),
        const SizedBox(height: 8.0),
        Container(
          width: itemWidth,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: MyColor.middleGrey,
              width: 2.0,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    '더보기',
                    style: MyTextStyle.descriptionMedium,
                  ),
                  const SizedBox(width: 8.0),
                  PhosphorIcon(
                    PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                    size: 16.0,
                  ),
                ],
              ),
            ),
          ),
        ),
        const SizedBox(height: 16.0),
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16.0),
            border: Border.all(
              color: MyColor.middleGrey,
              width: 2.0,
            ),
            color: MyColor.lightGrey,
          ),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '카드사 선택',
                  style: MyTextStyle.bodyMedium.copyWith(
                    color: MyColor.darkGrey,
                  ),
                ),
                PhosphorIcon(
                  PhosphorIcons.caretDown(PhosphorIconsStyle.bold),
                  size: 24.0,
                  color: MyColor.darkGrey,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 32.0),
        Row(
          children: [
            Text(
              '신용카드 무이자 할부 안내',
              style: MyTextStyle.minimumRegular,
            ),
            PhosphorIcon(
              PhosphorIcons.caretRight(),
              size: 16.0,
              color: MyColor.darkGrey,
            ),
          ],
        ),
        const SizedBox(height: 32.0),
        Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: PhosphorIcon(
                PhosphorIcons.check(PhosphorIconsStyle.bold),
                color: MyColor.primary,
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width - 120,
              child: Text(
                '[필수] 결제 서비스 이용 약관, 개인 정보 처리 동의',
                style: MyTextStyle.descriptionRegular.copyWith(
                  color: MyColor.darkGrey,
                ),
                maxLines: 2,
              ),
            ),
            PhosphorIcon(
              PhosphorIcons.caretRight(),
              size: 20.0,
              color: MyColor.darkGrey,
            ),
          ],
        ),
      ],
    );
  }

  Widget renderBoxButton({
    required Widget image,
    required double itemWidth,
  }) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: itemWidth,
        height: itemWidth * 2 / 3,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.0),
            border: Border.all(
              color: MyColor.middleGrey,
              width: 2.0,
            )),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
          child: Center(
            child: image,
          ),
        ),
      ),
    );
  }
}
