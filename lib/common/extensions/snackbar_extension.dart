import 'package:demo/common/theme/app_colors.dart';
import 'package:flutter/material.dart';



extension SnackbarExtensions on BuildContext {
  void showSnackbar(String message,
      {Color backgroundColor = AppColors.backgroundDarkShadeOrange,
      Color textColor = AppColors.white}) {
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        content: Text(
          message,
          style: TextStyle(color: textColor),
        ),
        backgroundColor: backgroundColor,
      ),
    );
  }
}
