import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 're_auth_sheet.form.dart';
import 're_auth_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class ReAuthSheet extends StackedView<ReAuthSheetModel> with $ReAuthSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  const ReAuthSheet({
    super.key,
    required this.completer,
    required this.request,
  });

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Container(
      height: 0.7.sh,
      color: theme.scaffoldBackgroundColor,
      padding: kGlobalHorizontalPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        children: [
          10.verticalSpace,
          Center(
            child: Container(
              height: 4.r,
              width: 50.w,
              decoration: BoxDecoration(
                color: theme.colorScheme.onBackground.withOpacity(0.3),
                borderRadius: BorderRadius.all(const Radius.circular(50).r),
              ),
            ),
          ),
          16.verticalSpace,
          Text('Please Confirm', style: theme.textTheme.titleLarge),
          Text(
            'Type in your password to confirm',
            style: theme.textTheme.bodyMedium,
          ),
          20.verticalSpace,
          AppTextField(
            hint: 'Password',
            label: 'Password',
            enabled: !viewModel.isBusy,
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: Validators.validateLoginPassword,
            isPassword: true,
          ),
          20.verticalSpace,
          AppButton(
            title: 'Submit',
            disabled: passwordController.text.isEmpty || viewModel.isBusy,
            loading: viewModel.isBusy,
            onPressed: viewModel.submit,
          ),
        ],
      ),
    );
  }

  @override
  void onDispose(ReAuthSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(ReAuthSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  ReAuthSheetModel viewModelBuilder(BuildContext context) => ReAuthSheetModel();
}
