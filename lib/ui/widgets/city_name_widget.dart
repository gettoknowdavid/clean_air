import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/core/utils/date_formatter.dart';
import 'package:clean_air/models/city.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class CityNameWidget extends StatelessWidget {
  final City city;
  final void Function()? onTap;
  const CityNameWidget({super.key, required this.city, this.onTap});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;

    final today = DateTime.now();
    final formattedDate = dateFormatter(today.toIso8601String());

    return GestureDetector(
      onTap: onTap,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                '${city.name}',
                maxLines: 2,
                maxFontSize: 20,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleLarge?.copyWith(
                  color: theme.colorScheme.primary,
                ),
              ),
              3.verticalSpace,
              Text(
                formattedDate,
                style: textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onBackground.withOpacity(0.7),
                ),
              ),
            ],
          ),
          Icon(PhosphorIcons.regular.info, size: 12.r),
        ],
      ),
    );
  }
}
