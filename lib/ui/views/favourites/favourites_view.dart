import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

import 'favourites_viewmodel.dart';

class FavouritesView extends StackedView<FavouritesViewModel> {
  const FavouritesView({Key? key}) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.only(left: 25.0, right: 25.0),
      ),
    );
  }

  @override
  FavouritesViewModel viewModelBuilder(context) => FavouritesViewModel();
}
