import 'package:clean_air/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'theme_sheet_model.dart';

class ThemeSheet extends StackedView<ThemeSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ThemeSheet({
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
    const modes = ThemeMode.values;
    final length = modes.length;

    for (var i = 0; i < length; i++) {
      final isSelected = viewModel.selectedThemeMode(context) == modes[i];

      children.add(FilledButton.icon(
        onPressed: () => viewModel.setThemeMode(context, modes[i]),
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
        icon: Icon(viewModel.getIcon(modes[i])),
        label: Text(viewModel.getThemeModeName(modes[i])),
      ));
    }

    return Container(
      padding: kGlobalHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          14.verticalSpace,
          Text(
            'Select theme mode',
            style: theme.textTheme.titleLarge,
          ),
          if (request.description != null) ...[
            5.verticalSpace,
            Text(
              request.description!,
              style: theme.textTheme.bodyMedium,
              maxLines: 3,
              softWrap: true,
            ),
          ],
          20.verticalSpace,
          Column(
            children: children,
          ),
          20.verticalSpace,
        ],
      ),
      decoration: BoxDecoration(
        color: theme.colorScheme.background,
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  ThemeSheetModel viewModelBuilder(BuildContext context) => ThemeSheetModel();
}
