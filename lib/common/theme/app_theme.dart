import 'package:backbase/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

extension OctTextTheme on TextTheme {
  TextStyle appText16Primary(BuildContext context) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.normal,
      fontSize: 16,
      color: AppColors.primary,
    );
  }
  TextStyle appText20Primary(BuildContext context) {
    return TextStyle(
      fontStyle: FontStyle.normal,
      fontWeight: FontWeight.bold,
      fontSize: 18,
      color: AppColors.textMain,
    );
  }
}
