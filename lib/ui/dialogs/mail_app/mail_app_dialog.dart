import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'mail_app_dialog_model.dart';

class MailAppDialog extends StackedView<MailAppDialogModel> {
  final DialogRequest request;
  final Function(DialogResponse) completer;

  const MailAppDialog({
    super.key,
    required this.request,
    required this.completer,
  });

  @override
  Widget builder(context, viewModel, child) {
    return AlertDialog(
      title: const Text('Your mail apps', textAlign: TextAlign.center),
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: Column(
          children: [
            const Text(
              'Please select your preferred mail application',
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 10),
            request.data,
          ],
        ),
      ),
    );
  }

  @override
  MailAppDialogModel viewModelBuilder(context) => MailAppDialogModel();
}
