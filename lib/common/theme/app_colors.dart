import 'dart:ui' show Color;

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class AppColors {
  AppColors._();

  static const Color backgroundDarkShadeOrange = Color(0xFFF7FAFC);    // Light background
  static const Color white = Color(0xFFFFFFFF);              // Pure white
  static const Color primary = Color(0xFF1976D2);            // Blue primary (#1976D2)
  static const Color secondary = Color(0xFF1565C0);          // Darker blue secondary
  static const Color disabled = Color(0xFF90CAF9);           // Light blue for disabled
  static const Color accent = Color(0xFFE3F2FD);             // Very light blue (accent)
  static const Color card = Color(0xFF42A5F5);               // Medium blue for cards
  static const Color textMain = Color(0xFF212121);           // Dark text
  static const Color textMuted = Color(0xFF757575);          // Muted gray text
  static const Color borderColor = Color(0xFFE0E0E0);        // Light border
}