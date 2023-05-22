import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class AqiValueWidget extends ViewModelWidget<HomeViewModel> {
  final void Function()? onTap;

  const AqiValueWidget({super.key, this.onTap});

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        padding: const EdgeInsets.all(8).r,
        height: 0.7.sw,
        width: 0.7.sw,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: theme.colorScheme.background,
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              _getColor(viewModel.indexColor, 0 - 100, 0.06),
              _getColor(viewModel.indexColor, 100, 0.1),
            ],
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            16.verticalSpace,
            AutoSizeText(
              '${viewModel.airQuality!.aqi}',
              textAlign: TextAlign.center,
              minFontSize: 110,
              maxFontSize: 250,
              style: textTheme.displayLarge?.copyWith(
                fontWeight: FontWeight.bold,
                color: viewModel.indexColor,
              ),
            ),
            Text(
              'TAP TO LEARN MORE',
              textAlign: TextAlign.center,
              style: textTheme.bodySmall?.copyWith(
                color: Colors.grey[600],
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Color _getColor(Color baseColor, amount, [double opacity = 1]) {
    Map colors = {
      "red": baseColor.red,
      "green": baseColor.green,
      "blue": baseColor.blue
    };
    colors = colors.map((key, value) {
      if (value + amount < 0) return MapEntry(key, 0);
      if (value + amount > 255) return MapEntry(key, 255);
      return MapEntry(key, value + amount);
    });
    return Color.fromRGBO(
      colors["red"],
      colors["green"],
      colors["blue"],
      opacity,
    );
  }
}
