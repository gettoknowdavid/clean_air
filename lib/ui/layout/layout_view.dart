import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/ui/layout/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'layout_viewmodel.dart';

class LayoutView extends StackedView<LayoutViewModel> {
  const LayoutView({super.key});

  @override
  bool get disposeViewModel => false;

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: ExtendedNavigator(
        navigatorKey: StackedService.nestedNavigationKey(1),
        initialRoute: LayoutViewRoutes.homeView,
        router: LayoutViewRouter(),
      ),
      bottomNavigationBar: const AppBottomNavigationBar(),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(context) => LayoutViewModel();
}
