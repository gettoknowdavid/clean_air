import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PollutantItem extends StatelessWidget {
  final String value;
  final String name;

  const PollutantItem({
    super.key,
    required this.value,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final valuePercentage = int.parse(value) / 500 * 100;
    final pollutantColor = getColorLegend(int.parse(value));

    return SizedBox(
      height: 50.r,
      width: 50.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                value,
                style: textTheme.titleMedium?.copyWith(
                  fontSize: 18.sp,
                  height: 1.r,
                ),
              ),
              4.verticalSpace,
              Text(
                name.toUpperCase(),
                style: textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.6),
                  fontSize: 10.sp,
                  height: 1.r,
                ),
              ),
            ],
          ),
          10.horizontalSpace,
          Container(
            height: 30.r,
            width: 3.r,
            alignment: Alignment.bottomCenter,
            decoration: BoxDecoration(
              color: theme.colorScheme.primaryContainer.withOpacity(0.3),
              borderRadius: const BorderRadius.all(Radius.circular(30)).r,
            ),
            child: Container(
              height: (34 * valuePercentage) / 100,
              width: 3.r,
              decoration: BoxDecoration(
                color: pollutantColor,
                border: Border.all(color: pollutantColor),
                borderRadius: const BorderRadius.all(Radius.circular(30)).r,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
