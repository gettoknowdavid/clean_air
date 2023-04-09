import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/home/aqi_value_widget.dart';
import 'package:clean_air/ui/widgets/home/city_name_widget.dart';
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
            CityNameWidget(city: airQuality.city!),
            20.verticalSpace,
            AqiValueWidget(aqi: airQuality.aqi!),
            // 15.verticalSpace,
            // const _PollutionLevel(),
            // 10.verticalSpace,
            // const _HealthImplication(),
            // 30.verticalSpace,
            // const PollutantsGridView(),
            30.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(context) => DetailsViewModel();
}
