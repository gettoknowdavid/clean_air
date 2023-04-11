import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/models/pollution_level.dart';
import 'package:clean_air/ui/views/details/details_viewmodel.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class DetailAqiWidget extends ViewModelWidget<DetailsViewModel> {
  const DetailAqiWidget({super.key});

  @override
  Widget build(BuildContext context, DetailsViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return AqiSection(
      child: Column(
        children: [
          SizedBox(
            height: 60.r,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const _AqiValue(),
                10.horizontalSpace,
                const _CityName(),
              ],
            ),
          ),
          10.verticalSpace,
          Text(
            viewModel.pollutionLevel.toSentence(),
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium,
          ),
          4.verticalSpace,
          Text(
            viewModel.healthImplication,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(fontSize: 11.r),
          ),
        ],
      ),
    );
  }
}

class _CityName extends ViewModelWidget<DetailsViewModel> {
  const _CityName();

  @override
  Widget build(BuildContext context, DetailsViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AutoSizeText(
            viewModel.airQuality.city!.name!,
            maxFontSize: 20,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: textTheme.bodyLarge?.copyWith(height: 1.1.r),
          ),
          4.verticalSpace,
          AutoSizeText(
            viewModel.formattedDate,
            textAlign: TextAlign.center,
            style: textTheme.bodySmall?.copyWith(
              color: textTheme.bodySmall?.color?.withOpacity(0.6),
              fontSize: 10.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class _AqiValue extends ViewModelWidget<DetailsViewModel> {
  const _AqiValue();

  @override
  Widget build(BuildContext context, DetailsViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;

    return Container(
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
    );
  }
}
