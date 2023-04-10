import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/models/air_quality.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/home/aqi_section.dart';
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
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            AqiSection(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _AqiWidget(),
                  10.verticalSpace,
                  Text(
                    viewModel.healthImplication,
                    textAlign: TextAlign.center,
                    style: textTheme.bodySmall?.copyWith(fontSize: 11.r),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(context) => DetailsViewModel();
}

class _AqiWidget extends ViewModelWidget<DetailsViewModel> {
  const _AqiWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, DetailsViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    final today = DateTime.now();
    final formattedDate = dateFormatter(today.toIso8601String());

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60.r,
          width: 60.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.all(Radius.circular(12)).r,
            color: viewModel.colorLegend,
          ),
          child: AutoSizeText(
            '${viewModel.airQuality.aqi}',
            maxFontSize: 30,
            style: textTheme.headlineMedium?.copyWith(
              color: viewModel.textColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        10.horizontalSpace,
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AutoSizeText(
              viewModel.airQuality.city!.name!,
              maxFontSize: 16,
              maxLines: 2,
              style: textTheme.bodyLarge,
            ),
            AutoSizeText(formattedDate, style: textTheme.bodySmall),
            Text(
              'Showing nearest location',
              style: textTheme.bodySmall?.copyWith(
                color: Colors.grey[800],
                fontSize: 10.sp,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
