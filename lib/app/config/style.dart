import 'package:flutter/material.dart';

import 'color.dart';
import 'dimens.dart';

class AppStyle {
  static final smallTextStyle = TextStyle(
    color: AppColor.lightColor,
    fontSize: AppDimen.smallText,
  );

  static final mediumTextStyleDark = TextStyle(
    color: AppColor.paragraphColor,
    fontSize: AppDimen.normalText,
    fontWeight: FontWeight.w500,
  );

  static final mediumTitleStyleDark = TextStyle(
    color: AppColor.headingColor,
    fontSize: AppDimen.mediumTitle,
    fontWeight: FontWeight.bold,
  );

  static final normalTextStyleDark = TextStyle(
    color: AppColor.paragraphColor,
    fontSize: AppDimen.normalText,
  );
}
