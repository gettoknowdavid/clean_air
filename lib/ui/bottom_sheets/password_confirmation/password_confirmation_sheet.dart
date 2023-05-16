import 'package:clean_air/ui/common/app_constants.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:clean_air/ui/common/app_colors.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'password_confirmation_sheet.form.dart';
import 'password_confirmation_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'password', validator: Validators.validateLoginPassword),
])
class PasswordConfirmationSheet
    extends StackedView<PasswordConfirmationSheetModel>
    with $PasswordConfirmationSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  PasswordConfirmationSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);

    return Container(
      height: 0.3.sh,
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
          const Spacer(),
          Text('Confirm', style: theme.textTheme.titleLarge),
          Text(
            'Type in your current password to confirm the password change.',
            style: theme.textTheme.bodyMedium,
          ),
          const Spacer(),
          AppTextField(
            hint: 'Current Password',
            label: 'Current Password',
            enabled: !viewModel.isBusy,
            focusNode: passwordFocusNode,
            controller: passwordController,
            validator: Validators.validateLoginPassword,
            isPassword: true,
          ),
          const Spacer(),
          AppButton(
            title: 'Submit',
            disabled: passwordController.text.isEmpty || viewModel.isBusy,
            loading: viewModel.isBusy,
            onPressed: viewModel.submit,
          ),
          const Spacer(),
        ],
      ),
    );
  }

  @override
  void onDispose(PasswordConfirmationSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(PasswordConfirmationSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
  }

  @override
  PasswordConfirmationSheetModel viewModelBuilder(context) {
    return PasswordConfirmationSheetModel();
  }
}
