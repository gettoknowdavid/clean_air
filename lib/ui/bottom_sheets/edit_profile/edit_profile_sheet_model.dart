import 'dart:io';

import 'package:clean_air/app/app.bottomsheets.dart';
import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/models/user.dart';
import 'package:clean_air/services/auth_service.dart';
import 'package:clean_air/services/media_service.dart';
import 'package:clean_air/services/shared_preferences_service.dart';
import 'package:clean_air/ui/bottom_sheets/edit_profile/edit_profile_sheet.form.dart';
import 'package:stacked/stacked.dart';
import 'package:stacked_services/stacked_services.dart';

class EditProfileSheetModel extends FormViewModel with ListenableServiceMixin {
  EditProfileSheetModel() {
    listenToReactiveValues([_avatar, _file]);
  }

  final _authService = locator<AuthService>();
  final _bottomSheetService = locator<BottomSheetService>();
  final _mediaService = locator<MediaService>();
  final _preferences = locator<SharedPreferencesService>();

  final _file = ReactiveValue<File?>(null);
  File? get file => _file.value;

  final _avatar = ReactiveValue<String?>(null);
  String? get avatar => _avatar.value;

  bool get disabled => !hasName;

  bool get hasImage =>
      user?.avatar != null || user?.avatar != "" || _file.value != null;

  @override
  List<ListenableServiceMixin> get listenableServices => [_authService];

  User? get user => _authService.currentUser;

  void close() => _bottomSheetService.completeSheet(SheetResponse());

  Future<void> updateProfile() async {
    setBusy(true);
    final name = "${user!.uid}.jpg";
    if (_file.value != null) {
      final ref = _mediaService.storageRef.child('images/avatar/$name');
      await _mediaService.uploadFileToCloud(_file.value!.path, name, ref);
      _avatar.value = await _mediaService.getFileFromCloud(ref);
      await _preferences.writeImageFromNetwork(_avatar.value!);
    }

    final updatedUser = user?.copyWith(
      avatar: _avatar.value ?? user?.avatar,
      name: nameValue ?? user!.name,
    );

    await _authService.updateProfile(updatedUser!);

    notifyListeners();
    _bottomSheetService.completeSheet(SheetResponse());
  }

  Future<File?> showImageSourceBottomSheet() async {
    final response = await _bottomSheetService.showCustomSheet(
      variant: BottomSheetType.imageSource,
      enterBottomSheetDuration: const Duration(milliseconds: 100),
    );
    _file.value = response?.data;
    return response?.data;
  }
}
