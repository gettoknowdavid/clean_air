import 'package:clean_air/core/utils/aqi_helpers.dart';
import 'package:clean_air/models/iaqi.dart';
import 'package:clean_air/ui/views/details/details_viewmodel.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_neumorphic/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'weather_item.dart';

class WeatherGridView extends SelectorViewModelWidget<DetailsViewModel, IAqi> {
  const WeatherGridView({super.key});

  @override
  Widget build(BuildContext context, IAqi value) {
    final data = value.toJson().entries.where((e) => e.key != 'pm25').toList();
    final length = data.length;

    List<Widget> _items = [];

    for (var i = 0; i < length; i++) {
      final weatherKey = getWeatherType(data[i].key);
      final weatherValue = data[i].value.v;

      _items.add(WeatherItem(type: weatherKey, value: '$weatherValue'));
    }

    return AqiSection(
      title: 'WEATHER',
      child: GridView.count(
        padding: EdgeInsets.zero,
        crossAxisCount: 5,
        crossAxisSpacing: 10.0.r,
        shrinkWrap: true,
        childAspectRatio: 40 / 80,
        children: [..._items],
        physics: const NeverScrollableScrollPhysics(),
      ),
    );
  }

  @override
  IAqi selector(DetailsViewModel viewModel) => viewModel.airQuality.iaqi!;
}
