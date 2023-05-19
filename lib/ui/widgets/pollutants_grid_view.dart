import 'dart:convert';

import 'package:clean_air/models/daily.dart';
import 'package:clean_air/models/forecast_data.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:clean_air/ui/widgets/pollutant_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';




class PollutantsGridView extends StatelessWidget {
  final Daily daily;
  final DateTime? pollutionDay;
  const PollutantsGridView({super.key, required this.daily, this.pollutionDay});

  @override
  Widget build(BuildContext context) {
    final forecastData = daily.toJson().entries.toList();

    List<Widget> _pollutants = [];

    for (var i = 0; i < forecastData.length; i++) {
      final name = forecastData[i].key;
      final values = forecastData[i].value as List<dynamic>;
      final v = values
          .map((e) => ForecastData.fromJson(jsonDecode(jsonEncode(e))))
          .toList();
      final currentPoll = v.firstWhere((e) =>
          e.day!.day ==
          (pollutionDay == null ? DateTime.now().day : pollutionDay!.day));
      _pollutants.add(
        PollutantItem(
          value: '${currentPoll.avg}',
          name: name,
        ),
      );
    }

    return AqiSection(
      title: 'POLLUTANTS',
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 3,
        crossAxisSpacing: 30.0.r,
        shrinkWrap: true,
        childAspectRatio: 6 / 4,
        children: _pollutants,
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }
}
