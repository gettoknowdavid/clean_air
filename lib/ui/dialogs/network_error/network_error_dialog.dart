import 'package:flutter/material.dart';
import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'network_error_dialog_model.dart';

class NetworkErrorDialog extends StackedView<NetworkErrorDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NetworkErrorDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return AlertDialog(
      backgroundColor: theme.colorScheme.errorContainer,
      title: Text(
        'Network Error',
        textAlign: TextAlign.center,
        style: theme.textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      content: Text(
        kNoNetworkConnectionError,
        style: theme.textTheme.bodyLarge,
        textAlign: TextAlign.center,
      ),
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
  NetworkErrorDialogModel viewModelBuilder(context) =>
      NetworkErrorDialogModel();
}
