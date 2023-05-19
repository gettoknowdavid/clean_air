import 'dart:io';

import 'package:clean_air/app/app.locator.dart';
import 'package:clean_air/services/media_service.dart';
import 'package:stacked/stacked.dart';

class ImageSourceSheetModel extends BaseViewModel with ListenableServiceMixin {
  ImageSourceSheetModel() {
    listenToReactiveValues([_file]);
  }

  final _mediaService = locator<MediaService>();

  final _file = ReactiveValue<File?>(null);
  File? get file => _file.value;

  Future<File?> avatarChanged(bool fromGallery) async {
    final file = await _mediaService.getImage(fromGallery: fromGallery);
    if (file != null) {
      _file.value = File(file.path);
      return _file.value;
    } else {
      return null;
    }
  }
}
