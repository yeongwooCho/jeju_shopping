import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/component/default_button.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:jeju_shopping/common/layout/default_app_bar.dart';
import 'package:jeju_shopping/common/layout/default_layout.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TermScreen extends StatelessWidget {
  static String get routeName => "term";

  const TermScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultLayout(
      appbar: const DefaultAppBar(title: '이용 약관'),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 40.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 20.0),
            const Text(
              '서비스 이용 약관에\n동의해 주세요.',
              style: MyTextStyle.headTitle,
            ),
            const SizedBox(height: 40.0),
            Expanded(
              child: TermContainer(),
            ),
          ],
        ),
      ),
    );
  }
}

class TermContainer extends StatefulWidget {
  const TermContainer({super.key});

  @override
  State<TermContainer> createState() => _TermContainerState();
}

class _TermContainerState extends State<TermContainer> {
  bool isTotal = false;
  bool isUse = false;
  bool isPersonalInfo = false;
  bool isMarketing = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Column(
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isTotal = !isTotal;
                  if (isTotal) {
                    isUse = true;
                    isPersonalInfo = true;
                    isMarketing = true;
                  } else {
                    isUse = false;
                    isPersonalInfo = false;
                    isMarketing = false;
                  }
                });
              },
              child: Container(
                decoration: BoxDecoration(
                  color: isTotal ? MyColor.primary : MyColor.lightGrey,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      PhosphorIcon(
                        PhosphorIcons.check(),
                        size: 24.0,
                        color: isTotal ? MyColor.white : MyColor.text,
                      ),
                      const SizedBox(width: 12.0),
                      Text(
                        '전체 약관에 동의합니다.',
                        style: MyTextStyle.bodyTitleBold.copyWith(
                          color: isTotal ? MyColor.white : MyColor.text,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            _CheckBox(
              title: '이용약관 동의',
              isRequired: true,
              onTap: onTapUse,
              isSelected: isUse,
            ),
            const SizedBox(height: 8.0),
            _CheckBox(
              title: '개인정보 취급방침 동의',
              isRequired: true,
              onTap: onTapPersonalInfo,
              isSelected: isPersonalInfo,
            ),
            const SizedBox(height: 8.0),
            _CheckBox(
              title: '마케팅 정보 수신 동의',
              isRequired: false,
              onTap: onTapMarketing,
              isSelected: isMarketing,
            ),
          ],
        ),
        PrimaryButton(
          onPressed: isUse && isPersonalInfo ? () {} : null,
          child: const Text('확인'),
        ),
      ],
    );
  }

  void onTapUse() {
    setState(() {
      isUse = !isUse;
      if (!isUse) {
        isTotal = false;
      } else if (isPersonalInfo && isMarketing) {
        isTotal = true;
      }
    });
  }

  void onTapPersonalInfo() {
    setState(() {
      isPersonalInfo = !isPersonalInfo;
      if (!isPersonalInfo) {
        isTotal = false;
      } else if (isUse && isMarketing) {
        isTotal = true;
      }
    });
  }

  void onTapMarketing() {
    setState(() {
      isMarketing = !isMarketing;
      if (!isMarketing) {
        isTotal = false;
      } else if (isUse && isPersonalInfo) {
        isTotal = true;
      }
    });
  }
}

class _CheckBox extends StatelessWidget {
  final String title;
  final bool isRequired;
  final VoidCallback onTap;
  final bool isSelected;

  const _CheckBox({
    super.key,
    required this.title,
    required this.isRequired,
    required this.onTap,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColor.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  isSelected
                      ? PhosphorIcon(
                          PhosphorIcons.checkCircle(PhosphorIconsStyle.fill),
                          color: MyColor.primary,
                          size: 24.0,
                        )
                      : PhosphorIcon(
                          PhosphorIcons.circle(),
                          size: 24.0,
                        ),
                  const SizedBox(width: 8.0),
                  Text(
                    title,
                    style: MyTextStyle.descriptionRegular,
                  ),
                  const SizedBox(width: 8.0),
                  Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 1.0,
                        color: isRequired ? MyColor.primary : MyColor.darkGrey,
                      ),
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 6.0, vertical: 2.0),
                      child: Text(
                        isRequired ? '필수' : '선택',
                        style: MyTextStyle.minimumRegular.copyWith(
                          color:
                              isRequired ? MyColor.primary : MyColor.darkGrey,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              PhosphorIcon(
                PhosphorIcons.caretRight(),
                size: 24.0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
