import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'error_dialog_model.dart';

class ErrorDialog extends StackedView<ErrorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const ErrorDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    final description = request.description == null
        ? const SizedBox()
        : Text(
            request.description!,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          );

    return AlertDialog(
      backgroundColor: theme.colorScheme.errorContainer,
      title: Text(
        request.title ?? 'Hello Stacked Dialog!!',
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      content: description,
      actions: [
        AppButton(
          title: 'Close',
          background: theme.colorScheme.error,
          onPressed: () => completer(DialogResponse(confirmed: true)),
        ),
      ],
    );
  }

  @override
  ErrorDialogModel viewModelBuilder(BuildContext context) => ErrorDialogModel();
}
