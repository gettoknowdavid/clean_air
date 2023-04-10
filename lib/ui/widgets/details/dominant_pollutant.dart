import 'package:clean_air/ui/views/details/details_viewmodel.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class DominantPollutant
    extends SelectorViewModelWidget<DetailsViewModel, String> {
  const DominantPollutant({super.key});

  @override
  Widget build(BuildContext context, String value) {
    final theme = Theme.of(context);

    return AqiSection(
      title: 'DOMINANT POLLUTANT',
      child: Row(
        children: [
          Container(
            height: 56.r,
            width: 56.r,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: theme.colorScheme.onBackground.withOpacity(0.2),
              borderRadius: const BorderRadius.all(Radius.circular(12)).r,
            ),
            child: Text(
              value.toUpperCase(),
              style: theme.textTheme.bodyMedium,
            ),
          ),
          10.horizontalSpace,
          Expanded(
            child: Text(
              'Prolonged exposure may lead to asthma, respiratory inflammation, and deteriorated lung functions.',
              style: theme.textTheme.bodySmall?.copyWith(height: 1.2.r),
            ),
          ),
        ],
      ),
    );
  }

  @override
  String selector(viewModel) => viewModel.airQuality.dominentpol!;
}
