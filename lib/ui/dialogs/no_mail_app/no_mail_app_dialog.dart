import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'no_mail_app_dialog_model.dart';

class NoMailAppDialog extends StackedView<NoMailAppDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const NoMailAppDialog({
    Key? key,
    required this.request,
    required this.completer,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    return AlertDialog(
      title: const Text('Oops!', textAlign: TextAlign.center),
      content: const Text('No mail apps found', textAlign: TextAlign.center),
      actions: [
        TextButton(
          onPressed: () => completer(DialogResponse(confirmed: true)),
          child: const Text('Okay'),
        ),
      ],
    );
  }

  @override
  NoMailAppDialogModel viewModelBuilder(context) => NoMailAppDialogModel();
}
