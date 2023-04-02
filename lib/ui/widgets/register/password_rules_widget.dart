import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/views/register/register_view.form.dart';
import 'package:clean_air/ui/views/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class PasswordRulesWidget extends StackedView<RegisterViewModel>
    with $RegisterView {
  PasswordRulesWidget({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;

    final password = passwordController.text;
    List<Widget> children = [];
    final length = viewModel.rules.length;

    for (var i = 0; i < length; i++) {
      final rule = viewModel.rules[i];
      final label = rule["name"].toString();
      final isActive = password.isEmpty ? false : rule["rule"](password);

      final unsetColor = Theme.of(context).brightness == Brightness.light
          ? Colors.black38
          : Colors.white38;

      Color ruleColor = isActive ? Colors.green : unsetColor;

      children.add(
        SizedBox(
          width: (1.sw - kGlobalPadding) / 2.r,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, size: 18.r, color: ruleColor),
              6.horizontalSpace,
              Text(
                label,
                style: textTheme.bodySmall?.copyWith(color: ruleColor),
              )
            ],
          ),
        ),
      );
    }

    return Wrap(
      alignment: WrapAlignment.spaceEvenly,
      crossAxisAlignment: WrapCrossAlignment.start,
      runSpacing: 8.r,
      children: [...children],
    );
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
