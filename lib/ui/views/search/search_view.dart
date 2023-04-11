import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:clean_air/ui/widgets/layout_app_bar.dart';
import 'package:clean_air/ui/widgets/search/search_result_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';

import 'search_view.form.dart';
import 'search_viewmodel.dart';

@FormView(fields: [
  FormTextField(name: 'keyword', validator: Validators.validateName),
])
class SearchView extends StackedView<SearchViewModel> with $SearchView {
  SearchView({super.key});

  @override
  Widget builder(context, viewModel, child) {
    return Scaffold(
      appBar: LayoutAppBar(),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            10.verticalSpace,
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
              child: AppTextField(
                hint: 'Search city',
                controller: keywordController,
                focusNode: keywordFocusNode,
                prefixIcon: const Icon(PhosphorIcons.magnifyingGlass),
                textInputAction: TextInputAction.search,
                onFieldSubmitted: viewModel.search,
              ),
            ),
            20.verticalSpace,
            const _LoadingIndicator(),
            const _Empty(),
            const SearchResultList()
          ],
        ),
      ),
    );
  }

  @override
  SearchViewModel viewModelBuilder(context) => SearchViewModel();
}

class _Empty extends ViewModelWidget<SearchViewModel> {
  const _Empty();

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    if (viewModel.result.isEmpty && !viewModel.isBusy) {
      return Column(
        children: [
          30.verticalSpace,
          Image.asset('assets/images/empty-list-light.png', height: 0.8.sw),
          const Text('Oops! Nothing to see here', textAlign: TextAlign.center),
        ],
      );
    }

    return const SizedBox();
  }
}

class _LoadingIndicator extends ViewModelWidget<SearchViewModel> {
  const _LoadingIndicator();

  @override
  Widget build(BuildContext context, SearchViewModel viewModel) {
    if (viewModel.isBusy) {
      return Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: kGlobalPadding).r,
            child: const LinearProgressIndicator(),
          ),
          20.verticalSpace,
        ],
      );
    }

    return const SizedBox();
  }
}
