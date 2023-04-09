import 'package:clean_air/ui/common/app_colors.dart';
import 'package:flutter/material.dart';

Color getColorLegend(int index) {
  switch (index ~/ 50) {
    case 0:
      return kGreen;
    case 1:
      return kYellow;
    case 2:
      return kOrange;
    case 3:
      return kRed;
    case 4:
    case 5:
      return kPurple;
    default:
      return kMaroon;
  }
}
