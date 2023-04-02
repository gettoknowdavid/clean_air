import 'package:animations/animations.dart';
import 'package:clean_air/ui/layout/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'layout_viewmodel.dart';

class LayoutView extends StackedView<LayoutViewModel> {
  const LayoutView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        child: viewModel.getView,
        transitionBuilder: (viewChild, primaryAnimation, secondaryAnimation) {
          return SharedAxisTransition(
            child: viewChild,
            animation: primaryAnimation,
            secondaryAnimation: secondaryAnimation,
            transitionType: SharedAxisTransitionType.horizontal,
          );
        },
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(context) => LayoutViewModel();
}
