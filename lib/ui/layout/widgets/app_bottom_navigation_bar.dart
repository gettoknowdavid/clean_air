import 'package:clean_air/ui/layout/layout_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';

final items = [
  BottomNavigationBarItem(
    label: 'Home',
    icon: PhosphorIcon(PhosphorIcons.regular.house),
    activeIcon: PhosphorIcon(PhosphorIcons.fill.house),
  ),
  BottomNavigationBarItem(
    label: 'Search',
    icon: PhosphorIcon(PhosphorIcons.regular.magnifyingGlass),
    activeIcon: PhosphorIcon(PhosphorIcons.fill.magnifyingGlass),
  ),
  BottomNavigationBarItem(
    label: 'Favorites',
    icon: PhosphorIcon(PhosphorIcons.regular.heart),
    activeIcon: PhosphorIcon(PhosphorIcons.fill.heart),
  ),
  BottomNavigationBarItem(
    label: 'Profile',
    icon: PhosphorIcon(PhosphorIcons.regular.user),
    activeIcon: PhosphorIcon(PhosphorIcons.fill.user),
  ),
];

class AppBottomNavigationBar extends ViewModelWidget<LayoutViewModel> {
  const AppBottomNavigationBar({super.key});

  @override
  Widget build(context, viewModel) {
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      currentIndex: viewModel.currentIndex,
      onTap: viewModel.handleNavigation,
      items: items,
    );
  }
}
