// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// StackedFormGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs, constant_identifier_names, non_constant_identifier_names,unnecessary_this

import 'package:clean_air/ui/common/validators.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';

const String KeywordValueKey = 'keyword';

final Map<String, TextEditingController> _SearchViewTextEditingControllers = {};

final Map<String, FocusNode> _SearchViewFocusNodes = {};

final Map<String, String? Function(String?)?> _SearchViewTextValidations = {
  KeywordValueKey: Validators.validateName,
};

mixin $SearchView {
  TextEditingController get keywordController =>
      _getFormTextEditingController(KeywordValueKey);
  FocusNode get keywordFocusNode => _getFormFocusNode(KeywordValueKey);

  TextEditingController _getFormTextEditingController(
    String key, {
    String? initialValue,
  }) {
    if (_SearchViewTextEditingControllers.containsKey(key)) {
      return _SearchViewTextEditingControllers[key]!;
    }

    _SearchViewTextEditingControllers[key] =
        TextEditingController(text: initialValue);
    return _SearchViewTextEditingControllers[key]!;
  }

  FocusNode _getFormFocusNode(String key) {
    if (_SearchViewFocusNodes.containsKey(key)) {
      return _SearchViewFocusNodes[key]!;
    }
    _SearchViewFocusNodes[key] = FocusNode();
    return _SearchViewFocusNodes[key]!;
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  void syncFormWithViewModel(FormViewModel model) {
    keywordController.addListener(() => _updateFormData(model));
  }

  /// Registers a listener on every generated controller that calls [model.setData()]
  /// with the latest textController values
  @Deprecated(
    'Use syncFormWithViewModel instead.'
    'This feature was deprecated after 3.1.0.',
  )
  void listenToFormUpdated(FormViewModel model) {
    keywordController.addListener(() => _updateFormData(model));
  }

  static const bool _autoTextFieldValidation = true;
  bool validateFormFields(FormViewModel model) {
    _updateFormData(model, forceValidate: true);
    return model.isFormValid;
  }

  /// Updates the formData on the FormViewModel
  void _updateFormData(FormViewModel model, {bool forceValidate = false}) {
    model.setData(
      model.formValueMap
        ..addAll({
          KeywordValueKey: keywordController.text,
        }),
    );

    if (_autoTextFieldValidation || forceValidate) {
      updateValidationData(model);
    }
  }

  /// Calls dispose on all the generated controllers and focus nodes
  void disposeForm() {
    // The dispose function for a TextEditingController sets all listeners to null

    for (var controller in _SearchViewTextEditingControllers.values) {
      controller.dispose();
    }
    for (var focusNode in _SearchViewFocusNodes.values) {
      focusNode.dispose();
    }

    _SearchViewTextEditingControllers.clear();
    _SearchViewFocusNodes.clear();
  }
}

extension ValueProperties on FormViewModel {
  bool get isFormValid =>
      this.fieldsValidationMessages.values.every((element) => element == null);
  String? get keywordValue => this.formValueMap[KeywordValueKey] as String?;

  set keywordValue(String? value) {
    this.setData(
      this.formValueMap
        ..addAll({
          KeywordValueKey: value,
        }),
    );

    if (_SearchViewTextEditingControllers.containsKey(KeywordValueKey)) {
      _SearchViewTextEditingControllers[KeywordValueKey]?.text = value ?? '';
    }
  }

  bool get hasKeyword =>
      this.formValueMap.containsKey(KeywordValueKey) &&
      (keywordValue?.isNotEmpty ?? false);

  bool get hasKeywordValidationMessage =>
      this.fieldsValidationMessages[KeywordValueKey]?.isNotEmpty ?? false;

  String? get keywordValidationMessage =>
      this.fieldsValidationMessages[KeywordValueKey];
}

extension Methods on FormViewModel {
  setKeywordValidationMessage(String? validationMessage) =>
      this.fieldsValidationMessages[KeywordValueKey] = validationMessage;

  /// Clears text input fields on the Form
  void clearForm() {
    keywordValue = '';
  }

  /// Validates text input fields on the Form
  void validateForm() {
    this.setValidationMessages({
      KeywordValueKey: getValidationMessage(KeywordValueKey),
    });
  }
}

/// Returns the validation message for the given key
String? getValidationMessage(String key) {
  final validatorForKey = _SearchViewTextValidations[key];
  if (validatorForKey == null) return null;

  String? validationMessageForKey = validatorForKey(
    _SearchViewTextEditingControllers[key]!.text,
  );

  return validationMessageForKey;
}

/// Updates the fieldsValidationMessages on the FormViewModel
void updateValidationData(FormViewModel model) => model.setValidationMessages({
      KeywordValueKey: getValidationMessage(KeywordValueKey),
    });
