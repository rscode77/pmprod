import 'package:flutter/material.dart';

class AppColors {
  static const Color blackPrimary = Color(0xFF2d3335);
  static const Color backgroundGrey = Color(0xFFfbfbfb);
  static const Color blue = Color(0xFF0066C4);
  static const Color green = Color(0xFF1e8a58);
  static const Color grey = Color(0xFFf3f3f2);
  static const Color grey100 = Color(0xFFF8F8F8);
  static const Color grey150 = Color(0xFFF5F5F5);
  static const Color grey200 = Color(0xFFD3D3D3);
  static const Color grey300 = Color(0xFF595959);
  static const Color grey400 = Color(0xFFbebdbd);
  static const Color grey600 = Color(0xFF595959);
  static const Color grey700 = Color(0xFF5F5F5F);
  static const Color grey800 = Color(0xFF4C4C4C);
  static const Color grey900 = Color(0xFF353535);
  static const Color grey1000 = Color(0xFF1a1a1a);
  static const Color orange = Color(0xFFfb682f);
  static const Color red = Color(0xFFE10019);
  static const Color textFieldGrey = Color(0xFFF0F0F0);
  static const Color white = Color(0xFFFFFFFF);

  static const MaterialColor whiteMaterialColor = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: Colors.white,
      100: Colors.white,
      200: Colors.white,
      300: Colors.white,
      400: Colors.white,
      500: Colors.white,
      600: Colors.white,
      700: Colors.white,
      800: Colors.white,
      900: Colors.white,
    },
  );

  static const MaterialColor whiteMaterialGrey = MaterialColor(
    0xFFFFFFFF,
    <int, Color>{
      50: grey1000,
      100: grey1000,
      200: grey1000,
      300: grey1000,
      400: grey1000,
      500: grey1000,
      600: grey1000,
      700: grey1000,
      800: grey1000,
      900: grey1000,
    },
  );
}
