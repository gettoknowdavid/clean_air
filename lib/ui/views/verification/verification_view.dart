import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'verification_viewmodel.dart';

class VerificationView extends StackedView<VerificationViewModel> {
  const VerificationView({Key? key}) : super(key: key);

  @override
  Widget builder(
    BuildContext context,
    VerificationViewModel viewModel,
    Widget? child,
  ) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  VerificationViewModel viewModelBuilder(
    BuildContext context,
  ) =>
      VerificationViewModel();
}
