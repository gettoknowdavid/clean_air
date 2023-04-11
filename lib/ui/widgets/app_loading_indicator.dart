import 'package:clean_air/ui/common/app_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

class AppLoadingIndicator<T extends BaseViewModel> extends ViewModelWidget<T> {
  final bool addBottomSpace;
  const AppLoadingIndicator({super.key, this.addBottomSpace = true});

  @override
  Widget build(BuildContext context, T viewModel) {
    if (viewModel.isBusy) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
            child: const LinearProgressIndicator(),
          ),
          addBottomSpace ? 20.verticalSpace : 0.verticalSpace,
        ],
      );
    }

    return const SizedBox();
  }
}
