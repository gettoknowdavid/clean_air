import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

const items = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: Icon(PhosphorIcons.house),
    activeIcon: Icon(PhosphorIcons.houseFill),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: Icon(PhosphorIcons.magnifyingGlass),
    activeIcon: Icon(PhosphorIcons.magnifyingGlassFill),
  ),
  BottomNavigationBarItem(
    label: 'Favorites',
    icon: Icon(PhosphorIcons.heart),
    activeIcon: Icon(PhosphorIcons.heartFill),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: Icon(PhosphorIcons.user),
    activeIcon: Icon(PhosphorIcons.userFill),
  ),
];

class AppBottomNavigationBar extends StackedView<LayoutViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Container(
      decoration: const BoxDecoration(border: Border(top: BorderSide())),
      child: BottomNavigationBar(
        currentIndex: viewModel.currentIndex,
        onTap: viewModel.setIndex,
        items: items,
      ),
    );
  }

  @override
  LayoutViewModel viewModelBuilder(context) => LayoutViewModel();
}
