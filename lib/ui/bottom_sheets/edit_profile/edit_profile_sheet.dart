import 'package:clean_air/ui/bottom_sheets/edit_profile/edit_profile_sheet.form.dart';
import 'package:clean_air/ui/common/validators.dart';
import 'package:clean_air/ui/widgets/app_button.dart';
import 'package:clean_air/ui/widgets/app_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked/stacked_annotations.dart';
import 'package:stacked_services/stacked_services.dart';

import 'edit_profile_sheet_model.dart';

@FormView(fields: [
  FormTextField(name: 'name', validator: Validators.validateName),
  FormTextField(name: 'avatarUrl'),
])
class EditProfileSheet extends StackedView<EditProfileSheetModel>
    with $EditProfileSheet {
  final Function(SheetResponse response)? completer;
  final SheetRequest request;
  EditProfileSheet({
    Key? key,
    required this.completer,
    required this.request,
  }) : super(key: key);

  @override
  Widget builder(context, viewModel, child) {
    final theme = Theme.of(context);
    return Container(
      height: 1.sh,
      color: theme.scaffoldBackgroundColor,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      child: SingleChildScrollView(
        child: Form(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              (30).verticalSpace,
              Row(
                children: [
                  Text(
                    'Edit Profile',
                    textAlign: TextAlign.center,
                    style: theme.textTheme.titleLarge,
                  ),
                  const Spacer(),
                  IconButton(
                    onPressed: viewModel.close,
                    icon: PhosphorIcon(PhosphorIcons.regular.x),
                  ),
                ],
              ),
              20.verticalSpace,
              const _Avatar(),
              40.verticalSpace,
              AppTextField(
                label: 'Name',
                hint: 'Enter name',
                focusNode: nameFocusNode,
                controller: nameController,
                enabled: !viewModel.isBusy,
                validator: Validators.validateName,
              ),
              30.verticalSpace,
              AppButton(
                onPressed: viewModel.updateProfile,
                loading: viewModel.isBusy,
                disabled: viewModel.disabled,
                title: 'Save',
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void onDispose(EditProfileSheetModel viewModel) {
    super.onDispose(viewModel);
    disposeForm();
  }

  @override
  void onViewModelReady(EditProfileSheetModel viewModel) {
    syncFormWithViewModel(viewModel);
    nameController.text = viewModel.user!.name;
    if (viewModel.user?.avatar != null) {
      avatarUrlController.text = viewModel.user!.avatar!;
    }
  }

  @override
  EditProfileSheetModel viewModelBuilder(context) => EditProfileSheetModel();
}

class _Avatar extends ViewModelWidget<EditProfileSheetModel> {
  const _Avatar();

  @override
  Widget build(BuildContext context, EditProfileSheetModel viewModel) {
    final theme = Theme.of(context);
    final outerRadius = 0.17.sw;
    final innerRadius = 0.165.sw;
    final iconSize = innerRadius * 0.6;

    return GestureDetector(
      onTap: viewModel.showImageSourceBottomSheet,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: outerRadius,
            backgroundColor: theme.colorScheme.onBackground,
            child: CircleAvatar(
              radius: innerRadius,
              foregroundImage:
                  viewModel.file == null && viewModel.user?.avatar != null
                      ? NetworkImage(viewModel.user!.avatar!)
                      : null,
              backgroundImage:
                  viewModel.file != null ? FileImage(viewModel.file!) : null,
              child: !viewModel.hasImage
                  ? PhosphorIcon(PhosphorIcons.regular.user, size: iconSize)
                  : null,
            ),
          ),
          PhosphorIcon(PhosphorIcons.regular.pen, size: iconSize),
        ],
      ),
    );
  }
}
