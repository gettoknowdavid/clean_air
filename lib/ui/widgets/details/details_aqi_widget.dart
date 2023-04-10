import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/core/utils/date_formatter.dart';
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

    final today = DateTime.now();
    final formattedDate = dateFormatter(today.toIso8601String());

    return AqiSection(
      child: Column(
        children: [
          Row(
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
