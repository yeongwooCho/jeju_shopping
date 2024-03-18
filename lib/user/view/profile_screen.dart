import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:jeju_shopping/common/component/see_more_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:jeju_shopping/delivery/view/delivery_screen.dart';
import 'package:jeju_shopping/life_style/model/enum/life_style_title.dart';
import 'package:jeju_shopping/life_style/provider/life_style_provider.dart';
import 'package:jeju_shopping/life_style/view/eating_habit_screen.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends ConsumerWidget {
  static String get routeName => "profile";

  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final lifeStyle = ref.watch(lifeStyleProvider);

    return DefaultLayout(
      appbar: const DefaultAppBar(title: '내 정보'),
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20.0),
          child: Column(
            children: [
              Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(100.0),
                    child: Image.asset(
                      'asset/img/user/user.png',
                      width: 88.0,
                      height: 88.0,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(width: 12.0),
                  Text(
                    '최지우',
                    style: MyTextStyle.bigTitleRegular,
                  ),
                ],
              ),
              const SizedBox(height: 20.0),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1.0,
                    color: MyColor.middleGrey,
                  ),
                  borderRadius: BorderRadius.circular(16.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '라이프스타일',
                            style: MyTextStyle.bigTitleRegular,
                          ),
                          SeeMoreButton(
                            title: '재 설정',
                            onTap: () {
                              context.goNamed(EatingHabitScreen.routeName);
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        '식습관',
                        style: MyTextStyle.descriptionRegular,
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          renderLifeStyleBox(
                            title: LifeStyleTitle.eating.label,
                            description: lifeStyle.eating,
                          ),
                          const SizedBox(width: 8.0),
                          renderLifeStyleBox(
                            title: LifeStyleTitle.taste.label,
                            description: lifeStyle.taste,
                          ),
                        ],
                      ),
                      const SizedBox(height: 8.0),
                      const Text(
                        '생활습관',
                        style: MyTextStyle.descriptionRegular,
                      ),
                      const SizedBox(height: 4.0),
                      Row(
                        children: [
                          renderLifeStyleBox(
                            title: LifeStyleTitle.place.label,
                            description: lifeStyle.place,
                          ),
                          const SizedBox(width: 8.0),
                          renderLifeStyleBox(
                            title: LifeStyleTitle.exercise.label,
                            description: lifeStyle.exercise,
                          ),
                          const SizedBox(width: 8.0),
                          renderLifeStyleBox(
                            title: LifeStyleTitle.sleep.label,
                            description: lifeStyle.sleep,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20.0),
              Column(
                children: [
                  ProfileMenuButton(
                    icon: PhosphorIcons.userList(),
                    title: '내 정보 변경',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12.0),
                  ProfileMenuButton(
                    icon: PhosphorIcons.truck(),
                    title: '배송 현황',
                    onTap: () {
                      context.goNamed(DeliveryScreen.routeName);
                    },
                  ),
                  const SizedBox(height: 12.0),
                  ProfileMenuButton(
                    icon: PhosphorIcons.files(),
                    title: '리뷰 관리',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12.0),
                  ProfileMenuButton(
                    icon: PhosphorIcons.heart(),
                    title: '찜 목록',
                    onTap: () {},
                  ),
                  const SizedBox(height: 12.0),
                  ProfileMenuButton(
                    icon: PhosphorIcons.question(),
                    title: 'Q & A',
                    onTap: () {},
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget renderLifeStyleBox({
    required String title,
    required String description,
  }) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1.0,
          color: MyColor.primary,
        ),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Column(
          children: [
            Text(
              title,
              style: MyTextStyle.minimumRegular,
            ),
            Text(
              description,
              style: MyTextStyle.bodyTitleRegular.copyWith(
                color: MyColor.primary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileMenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuButton({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
        child: Row(
          children: [
            PhosphorIcon(
              icon,
              size: 32.0,
            ),
            const SizedBox(width: 16.0),
            Text(
              title,
              style: MyTextStyle.bodyBold,
            ),
          ],
        ),
      ),
    );
  }
}
