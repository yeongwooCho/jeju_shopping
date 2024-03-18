import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:jeju_shopping/common/component/divider_container.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';

class DeliveryScreen extends ConsumerWidget {
  static String get routeName => 'delivery';

  const DeliveryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '배송 현황'),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 20.0, horizontal: 24.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                renderDeliveryAmount(count: 24, title: '전체'),
                renderDeliveryAmount(count: 24, title: '준비중'),
                renderDeliveryAmount(count: 24, title: '배송중'),
                renderDeliveryAmount(count: 24, title: '배송완료'),
              ],
            ),
          ),
          const DividerContainer(),
        ],
      ),
    );
  }

  Widget renderDeliveryAmount({
    required int count,
    required String title,
  }) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Text(
            count.toString(),
            style: MyTextStyle.bigTitleBold,
          ),
          Text(
            title,
            style: MyTextStyle.minimumRegular,
          ),
        ],
      ),
    );
  }
}
