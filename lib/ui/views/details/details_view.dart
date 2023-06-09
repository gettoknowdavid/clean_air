import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/models/condition.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:clean_air/ui/widgets/details/details_aqi_widget.dart';
import 'package:clean_air/ui/widgets/details/dominant_pollutant.dart';
import 'package:clean_air/ui/widgets/details/weather_grid_view.dart';
import 'package:clean_air/ui/widgets/pollutants_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  final AirQuality airQuality;

  const DetailsView({super.key, required this.airQuality});

  @override
  void onViewModelReady(DetailsViewModel viewModel) {
    viewModel.init(airQuality);
    super.onViewModelReady(viewModel);
  }

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details'), scrolledUnderElevation: 0.0),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            10.verticalSpace,
            const DetailAqiWidget(),
            16.verticalSpace,
            PollutantsGridView(daily: airQuality.forecast!.daily!),
            16.verticalSpace,
            const _HealthConditionWidget(),
            16.verticalSpace,
            const WeatherGridView(),
            20.verticalSpace,
            const DominantPollutant(),
            50.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(BuildContext context) => DetailsViewModel();
}

class _HealthConditionWidget extends ViewModelWidget<DetailsViewModel> {
  const _HealthConditionWidget();

  @override
  Widget build(BuildContext context, DetailsViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;
    return AqiSection(
      title: 'HEALTH CONDITION',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          if (viewModel.conditionAQI.condition != Condition.none) ...[
            Text(
              viewModel.conditionAQI.message!,
              style: textTheme.bodyMedium?.copyWith(letterSpacing: 0),
            ),
            6.verticalSpace,
            InkWell(
              onTap: viewModel.showHealthConditionInfo,
              child: Text(
                'Learn more',
                style: textTheme.labelLarge?.copyWith(
                  color: textTheme.labelLarge?.color?.withOpacity(0.8),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
            10.verticalSpace,
          ],
          FilledButton(
            onPressed: viewModel.setHealthCondition,
            style: FilledButton.styleFrom(
              textStyle: textTheme.labelLarge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10).r),
              ),
            ),
            child: Text(viewModel.conditionAQI.condition.name),
          ),
        ],
      ),
    );
  }
}
