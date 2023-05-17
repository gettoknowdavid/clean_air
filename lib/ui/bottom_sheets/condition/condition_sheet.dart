import 'package:clean_air/models/condition.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'condition_sheet_model.dart';

class ConditionSheet extends StackedView<ConditionSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ConditionSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    List<Widget> children = [];
    const conditions = Condition.values;
    final length = conditions.length;

    children.add(
      Padding(
        padding: const EdgeInsets.only(top: 4, bottom: 16).r,
        child: Text(
          'Select preferred health condition',
          style: textTheme.bodyLarge,
        ),
      ),
    );

    for (var i = 0; i < length; i++) {
      final isSelected = viewModel.conditionFromService == conditions[i];

      children.add(FilledButton(
        onPressed: () => viewModel.setHealthCondition(completer, conditions[i]),
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

    return Container(
      color: theme.scaffoldBackgroundColor,
      padding: kGlobalHorizontalPadding,
      child: Wrap(children: children),
    );
  }

  @override
  ConditionSheetModel viewModelBuilder(context) => ConditionSheetModel();
}
