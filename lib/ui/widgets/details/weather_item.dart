import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/models/weather_type.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WeatherItem extends StatelessWidget {
  final WeatherType type;
  final String value;

  const WeatherItem({super.key, required this.type, required this.value});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    return Container(
      height: 85.h,
      width: 50.w,
      padding: const EdgeInsets.symmetric(horizontal: 4).r,
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor.withOpacity(0.2),
        borderRadius: const BorderRadius.all(Radius.circular(14)).r,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          10.verticalSpace,
          Icon(type.toIcon(), size: 18.sp),
          5.verticalSpace,
          AutoSizeText(
            value,
            maxFontSize: 18,
            maxLines: 1,
            style: textTheme.titleLarge,
          ),
          5.verticalSpace,
          AutoSizeText(
            type.toUnit(),
            maxFontSize: 12,
            maxLines: 1,
            style: textTheme.bodySmall?.copyWith(
              color: textTheme.bodySmall?.color?.withOpacity(0.4),
            ),
          ),
          10.verticalSpace,
        ],
      ),
    );
  }
}
