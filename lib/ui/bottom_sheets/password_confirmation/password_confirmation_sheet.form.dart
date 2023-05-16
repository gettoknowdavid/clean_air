// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:clean_air/ui/common/validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String PasswordValueKey = 'password';

final Map<String, TextEditingController>
    _PasswordConfirmationSheetTextEditingControllers = {};

final Map<String, FocusNode> _PasswordConfirmationSheetFocusNodes = {};

final Map<String, String? Function(String?)?>
    _PasswordConfirmationSheetTextValidations = {
  PasswordValueKey: Validators.validateLoginPassword,
};

mixin $PasswordConfirmationSheet on StatelessWidget {
  TextEditingController get passwordController =>
      _getFormTextEditingController(PasswordValueKey);
  FocusNode get passwordFocusNode => _getFormFocusNode(PasswordValueKey);

  TextEditingController _getFormTextEditingController(String key,
      {String? initialValue}) {
    if (_PasswordConfirmationSheetTextEditingControllers.containsKey(key)) {
      return _PasswordConfirmationSheetTextEditingControllers[key]!;
    }
    _PasswordConfirmationSheetTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _PasswordConfirmationSheetTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_PasswordConfirmationSheetFocusNodes.containsKey(key)) {
      return _PasswordConfirmationSheetFocusNodes[key]!;
    }
    _PasswordConfirmationSheetFocusNodes[key] = FocusNode();
    return _PasswordConfirmationSheetFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    passwordController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated('Use syncFormWithViewModel instead.'
      'This feature was deprecated after 3.1.0.')
  void listenToFormUpdated(FormViewModel model) {
    passwordController.addListener(() => _updateFormData(model));
  }

  final bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          PasswordValueKey: passwordController.text,
        }),
    );
    if (_autoTextFieldValidation || forceValidate) {
      _updateValidationData(model);
    }
  }

  /// Updates the fieldsValidationMessages on the FormViewModel
  void _updateValidationData(FormViewModel model) =>
      model.setValidationMessages({
        PasswordValueKey: _getValidationMessage(PasswordValueKey),
      });

  /// Returns the validation message for the given key
  String? _getValidationMessage(String key) {
    final validatorForKey = _PasswordConfirmationSheetTextValidations[key];
    if (validatorForKey == null) return null;
    String? validationMessageForKey = validatorForKey(
        _PasswordConfirmationSheetTextEditingControllers[key]!.text);
    return validationMessageForKey;
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller
        in _PasswordConfirmationSheetTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _PasswordConfirmationSheetFocusNodes.values) {
      focusNode.dispose();
    }

    _PasswordConfirmationSheetTextEditingControllers.clear();
    _PasswordConfirmationSheetFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get passwordValue => this.formValueMap[PasswordValueKey] as String?;

  set passwordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          PasswordValueKey: value,
        }),
    );

    if (_PasswordConfirmationSheetTextEditingControllers.containsKey(
        PasswordValueKey)) {
      _PasswordConfirmationSheetTextEditingControllers[PasswordValueKey]?.text =
          value ?? '';
    }
  }

  bool get hasPassword =>
      this.formValueMap.containsKey(PasswordValueKey) &&
      (passwordValue?.isNotEmpty ?? false);

  bool get hasPasswordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey]?.isNotEmpty ?? false;

  String? get passwordValidationMessage =>
      this.fieldsValidationMessages[PasswordValueKey];
  void clearForm() {
    passwordValue = '';
  }
}

extension Methods on FormViewModel {
  setPasswordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[PasswordValueKey] = validationMessage;
}
