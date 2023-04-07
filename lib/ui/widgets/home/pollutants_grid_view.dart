import 'dart:convert';

import 'package:clean_air/models/daily.dart';
import 'package:clean_air/models/forecast_data.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:clean_air/ui/widgets/home/pollutant_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class PollutantsGridView extends SelectorViewModelWidget<HomeViewModel, Daily> {
  const PollutantsGridView({super.key});
  @override
  Widget build(BuildContext context, Daily value) {
    final theme = Theme.of(context);
    final isDark = theme.brightness == Brightness.dark;

    final forecastData = value.toJson().entries.toList();

    List<Widget> _pollutants = [];

    for (var i = 0; i < forecastData.length; i++) {
      final name = forecastData[i].key;
      final values = forecastData[i].value as List<dynamic>;
      final v = values
          .map((e) => ForecastData.fromJson(jsonDecode(jsonEncode(e))))
          .toList();
      final currentPollutant =
          v.firstWhere((e) => e.day!.day == DateTime.now().day);
      _pollutants.add(
        PollutantWidget(value: '${currentPollutant.avg}', name: name),
      );
    }

    return Container(
      width: 1.sw,
      padding: const EdgeInsets.all(kGlobalPadding).r,
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.all(Radius.circular(20)).r,
        color: isDark
            ? theme.colorScheme.background
            : theme.colorScheme.tertiaryContainer.withOpacity(0.1),
      ),
      child: GridView.count(
        crossAxisCount: 3,
        shrinkWrap: true,
        childAspectRatio: 6 / 4,
        physics: const NeverScrollableScrollPhysics(),
        children: _pollutants,
      ),
    );
  }

  @override
  Daily selector(viewModel) => viewModel.airQuality!.forecast!.daily!;
}
