import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'reset_password_sheet_model.dart';

class ResetPasswordSheet extends StackedView<ResetPasswordSheetModel> {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;

  const ResetPasswordSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
    );
  }

  @override
  ResetPasswordSheetModel viewModelBuilder(context) =>
      ResetPasswordSheetModel();
}
