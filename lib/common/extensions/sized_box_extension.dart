import 'package:flutter/material.dart';

extension SizedBoxExt on num {
  SizedBox get heightBox => SizedBox(height: toDouble());
  SizedBox get widthBox => SizedBox(width: toDouble());
}
