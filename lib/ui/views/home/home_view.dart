import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/models/condition.dart';
import 'package:clean_air/models/pollution_level.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:clean_air/ui/widgets/city_name_widget.dart';
import 'package:clean_air/ui/widgets/home/aqi_value_widget.dart';
import 'package:clean_air/ui/widgets/layout_app_bar.dart';
import 'package:clean_air/ui/widgets/pollutants_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  bool get fireOnViewModelReadyOnce => false;

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Column(
          children: [
            CityNameWidget(
              city: viewModel.airQuality!.city!,
              onTap: viewModel.onTapCityName,
            ),
            10.verticalSpace,
            AqiValueWidget(onTap: viewModel.navigateToDetails),
            10.verticalSpace,
            const _PollutionLevel(),
            10.verticalSpace,
            const _HealthImplication(),
            20.verticalSpace,
            const _HealthConditionWidget(),
            10.verticalSpace,
            PollutantsGridView(daily: viewModel.airQuality!.forecast!.daily!),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  PreferredSize _buildAppBar() {
    return const PreferredSize(
      preferredSize: Size.fromHeight(kToolbarHeight),
      child: LayoutAppBar(),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}

class _HealthConditionWidget extends ViewModelWidget<HomeViewModel> {
  const _HealthConditionWidget();

  @override
  Widget build(BuildContext context, HomeViewModel viewModel) {
    final textTheme = Theme.of(context).textTheme;
    return AqiSection(
      title: 'HEALTH CONDITION',
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(
            viewModel.conditionAQI.message!,
            style: textTheme.bodyMedium?.copyWith(letterSpacing: 0),
          ),
          6.verticalSpace,
          FilledButton(
            onPressed: viewModel.setHealthCondition,
            style: FilledButton.styleFrom(
              textStyle: textTheme.labelLarge,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(const Radius.circular(10).r),
              ),
            ),
            child: Text(viewModel.conditionAQI.condition.name),
          ),
        ],
      ),
    );
  }
}

class _HealthImplication
    extends SelectorViewModelWidget<HomeViewModel, String> {
  const _HealthImplication();

  @override
  Widget build(BuildContext context, String value) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20.0).r,
      child: AutoSizeText(
        value,
        textAlign: TextAlign.center,
        maxLines: 3,
        maxFontSize: 16,
      ),
    );
  }

  @override
  String selector(HomeViewModel viewModel) => viewModel.healthImplication;
}

class _PollutionLevel
    extends SelectorViewModelWidget<HomeViewModel, PollutionLevel> {
  const _PollutionLevel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, PollutionLevel value) {
    final textTheme = Theme.of(context).textTheme;

    return Text(
      value.toName(),
      textAlign: TextAlign.center,
      style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
    );
  }

  @override
  PollutionLevel selector(viewModel) => viewModel.pollutionLevel;
}
