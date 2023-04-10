import 'package:clean_air/core/helpers/get_color_legend.dart';
import 'package:flutter/material.dart';

Color getColorLegendTextColor(int index) {
  var color = getColorLegend(index);
  var d = 0;
  var luminance =
      (0.299 * color.red + 0.587 * color.green + 0.114 * color.blue) / 255;

  if (luminance > 0.5) {
    d = 0;
  } else {
    d = 229;
  }
  return Color.fromARGB(color.alpha, d, d, d);
}
