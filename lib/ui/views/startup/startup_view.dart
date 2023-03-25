import 'package:clean_air/ui/common/app_strings.dart';
import 'package:clean_air/ui/common/ui_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:lottie/lottie.dart';
import 'package:stacked/stacked.dart';

import 'startup_viewmodel.dart';

class StartupView extends StackedView<StartupViewModel> {
  const StartupView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, Widget? child) {
    return Scaffold(
      body: Center(
        child: Lottie.asset(
          kLoadingAsset,
          height: screenHeightFraction(context, ratio: 4),
        ),
      ),
    );
  }

  @override
  StartupViewModel viewModelBuilder(BuildContext context) => StartupViewModel();

  @override
  void onViewModelReady(StartupViewModel viewModel) => SchedulerBinding.instance
      .addPostFrameCallback((timeStamp) => viewModel.runStartupLogic());
}
