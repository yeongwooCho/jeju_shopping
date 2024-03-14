
import 'package:flutter/material.dart';
import 'package:jeju_shopping/common/const/colors.dart';
import 'package:jeju_shopping/common/const/text_styles.dart';

class MyButtonStyle {
  static ButtonStyle primary = ElevatedButton.styleFrom(
    foregroundColor: MyColor.white,
    backgroundColor: MyColor.primary,
    elevation: 0,
    minimumSize: const Size(100, 50),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(8.0),
    ),
    textStyle: MyTextStyle.bodyBold.copyWith(
      color: MyColor.white,
    ),
  );

  static ButtonStyle secondary = ElevatedButton.styleFrom(
    foregroundColor: MyColor.primary,
    backgroundColor: MyColor.white,
    elevation: 0,
    minimumSize: const Size(100, 50),
    shape: RoundedRectangleBorder(
      side: const BorderSide(
        width: 1.0,
        color: MyColor.primary,
      ),
      borderRadius: BorderRadius.circular(8.0),
    ),
    // textStyle: MyTextStyle.bodyBold.copyWith(
    //   color: MyColor.primary,
    // ),
  );
}
