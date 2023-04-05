import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/app_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({super.key});

  @override
  bool get fireOnViewModelReadyOnce => false;

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;
    final leadingStyle = textTheme.titleMedium?.copyWith(height: 1.r);

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: kToolbarHeight * 1.2.r,
        leadingWidth: (kBottomNavigationBarHeight * 2).r,
        leading: Padding(
          padding: const EdgeInsets.only(left: kGlobalPadding).r,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Hi,', style: leadingStyle),
              AutoSizeText(
                'David',
                maxFontSize: 22,
                minFontSize: 18,
                style: leadingStyle?.copyWith(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        bottom: viewModel.isBusy
            ? PreferredSize(
                preferredSize: Size.fromHeight(1.r),
                child: Flexible(
                  child: LinearProgressIndicator(minHeight: 1.2.r),
                ),
              )
            : null,
        actions: [
          const AppAvatar(),
          kGlobalPadding.horizontalSpace,
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              Text(
                '${viewModel.data?.aqi}',
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
