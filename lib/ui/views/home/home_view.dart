import 'package:auto_size_text/auto_size_text.dart';
import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/widgets/app_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';

import 'home_viewmodel.dart';

class HomeView extends StackedView<HomeViewModel> {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final textTheme = Theme.of(context).textTheme;
    final leadingStyle = textTheme.titleMedium?.copyWith(height: 1.r);

    return Scaffold(
      appBar: AppBar(
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
        actions: [
          const AppAvatar(),
          kGlobalPadding.horizontalSpace,
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Spacer(),
              25.verticalSpace,
              MaterialButton(
                color: Colors.black,
                onPressed: viewModel.incrementCounter,
                child: Text(
                  viewModel.counterLabel,
                  style: const TextStyle(color: Colors.white),
                ),
              ),
              25.verticalSpace,
              MaterialButton(
                color: Colors.black,
                onPressed: viewModel.logout,
                child: const Text(
                  'Logout',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  @override
  HomeViewModel viewModelBuilder(context) => HomeViewModel();
}
