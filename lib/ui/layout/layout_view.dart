import 'package:clean_air/app/app.router.dart';
import 'package:clean_air/ui/layout/widgets/app_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

import 'layout_viewmodel.dart';

class LayoutView extends StackedView<LayoutViewModel> {
  const LayoutView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return WillPopScope(
      onWillPop: viewModel.onWillPop,
      child: Scaffold(
        body: ExtendedNavigator(
          navigatorKey: StackedService.nestedNavigationKey(1),
          initialRoute: LayoutViewRoutes.homeView,
          router: LayoutViewRouter(),
        ),
        floatingActionButton: viewModel.currentIndex == 2
            ? FloatingActionButton(
                onPressed: () => viewModel.handleNavigation(1),
                tooltip: 'Add City',
                child: PhosphorIcon(PhosphorIcons.regular.plus),
              )
            : null,
        bottomNavigationBar: const AppBottomNavigationBar(),
      ),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(context) => LayoutViewModel();
}
