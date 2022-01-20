
import 'package:flutter/material.dart';


class ExtraColor {
  static const colors = AppColors();

  const ExtraColor._();

  static ThemeData define() {
    return ThemeData();
  }
}
class AppColors {
  final bg1 = const Color(0xff3d4048);
  final bg2 = const Color(0xff1a1d24);
  final maincolor1 = const Color(0xffb259e7);
  final maincolor2 = const Color(0xff875ae8);
  
  const AppColors();
}
