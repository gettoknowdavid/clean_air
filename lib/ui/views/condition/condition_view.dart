import 'package:clean_air/models/condition.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/widgets/aqi_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'condition_viewmodel.dart';

class ConditionView extends StackedView<ConditionViewModel> {
  const ConditionView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;
    final backgroundColor = colorScheme.primary.withOpacity(0.1);
    final shape = RoundedRectangleBorder(
      borderRadius: const BorderRadius.all(Radius.circular(10)).r,
    );

    if (viewModel.isBusy) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    List<Widget> children = [];
    const conditions = Condition.values;
    final length = conditions.length;

    for (var i = 0; i < length; i++) {
      final isSelected = viewModel.conditionFromService == conditions[i];

      children.add(FilledButton(
        onPressed: () => viewModel.setHealthCondition(conditions[i]),
        style: FilledButton.styleFrom(
          backgroundColor:
              isSelected ? colorScheme.primary : colorScheme.primaryContainer,
          textStyle: textTheme.labelLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
          fixedSize: Size.fromWidth(1.sw),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(const Radius.circular(10).r),
          ),
        ),
        child: Text(conditions[i].name),
      ));
    }

    return Scaffold(
      appBar: AppBar(title: const Text('Health Condition')),
      body: SingleChildScrollView(
        padding: kGlobalHorizontalPadding,
        child: Column(
          children: [
            AqiSection(
              title: 'ABOUT HEALTH CONDITION',
              child: Padding(
                padding: const EdgeInsets.all(8.0).r,
                child: const Text(kAboutHealthCondition),
              ),
            ),
            20.verticalSpace,
            AqiSection(
              title: 'SET HEALTH CONDITION',
              child: Wrap(children: children),
            ),
            20.verticalSpace,
          ],
        ),
      ),
    );
  }

  @override
  ConditionViewModel viewModelBuilder(context) => ConditionViewModel();
}
