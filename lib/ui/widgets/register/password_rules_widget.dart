import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:clean_air/ui/views/register/register_view.form.dart';
import 'package:clean_air/ui/views/register/register_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

// Sum of global padding on left and right and additional Wrap padding: 20+20+8+8
const globalPadding = 52.0;

// Width of the wrap spacing
const passwordRulesWrapSpacing = 10.0;

class PasswordRulesWidget extends StackedView<RegisterViewModel>
    with $RegisterView {
  PasswordRulesWidget({super.key});

  @override
  Widget builder(context, viewModel, child) {
    final width = screenWidth(context);

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
          width: (width - (globalPadding + passwordRulesWrapSpacing)) / 2,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.check_circle, size: 18, color: ruleColor),
              const SizedBox(width: 6),
              Text(
                label,
                style: TextStyle(fontSize: 12, color: ruleColor),
              )
            ],
          ),
        ),
      );
    }

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Wrap(
        alignment: WrapAlignment.spaceEvenly,
        runSpacing: 8,
        children: [...children],
      ),
    );
  }

  @override
  RegisterViewModel viewModelBuilder(context) => RegisterViewModel();
}
