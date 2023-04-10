import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/details/details_aqi_widget.dart';
import 'package:clean_air/ui/widgets/details/dominant_pollutant.dart';
import 'package:clean_air/ui/widgets/details/health_condition_widget.dart';
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
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
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
            const HealthConditionWidget(),
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
