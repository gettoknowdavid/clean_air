import 'dart:convert';

import 'package:clean_air/models/daily.dart';
import 'package:clean_air/models/forecast_data.dart';
import 'package:clean_air/ui/views/home/home_viewmodel.dart';
import 'package:clean_air/ui/widgets/home/aqi_section.dart';
import 'package:clean_air/ui/widgets/home/pollutant_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class PollutantsGridView extends SelectorViewModelWidget<HomeViewModel, Daily> {
  const PollutantsGridView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, Daily value) {
    final forecastData = value.toJson().entries.toList();

    List<Widget> _pollutants = [];

    for (var i = 0; i < forecastData.length; i++) {
      final name = forecastData[i].key;
      final values = forecastData[i].value as List<dynamic>;
      final v = values
          .map((e) => ForecastData.fromJson(jsonDecode(jsonEncode(e))))
          .toList();
      final currentPoll = v.firstWhere((e) => e.day!.day == DateTime.now().day);
      _pollutants.add(
        PollutantItem(value: '${currentPoll.avg}', name: name),
      );
    }

    return AqiSection(
      title: 'POLLUTANTS',
      child: GridView.count(
        crossAxisCount: 3,
        crossAxisSpacing: 20.0.r,
        shrinkWrap: true,
        childAspectRatio: 6 / 4,
        children: _pollutants,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  Daily selector(viewModel) => viewModel.airQuality!.forecast!.daily!;
}
