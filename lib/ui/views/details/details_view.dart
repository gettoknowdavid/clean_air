import 'package:clean_air/models/air_quality.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'details_viewmodel.dart';

class DetailsView extends StackedView<DetailsViewModel> {
  final AirQuality airQuality;

  const DetailsView({super.key, required this.airQuality});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: AppBar(title: const Text('Details')),
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  DetailsViewModel viewModelBuilder(context) => DetailsViewModel();
}
