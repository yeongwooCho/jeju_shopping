import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class SeeMoreButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const SeeMoreButton({
    super.key,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: MyColor.white,
        child: Row(
          children: [
            Text(
              title,
              style: MyTextStyle.minimumRegular,
            ),
            PhosphorIcon(
              PhosphorIcons.caretRight(),
              size: 16.0,
            ),
          ],
        ),
      ),
    );
  }
}
