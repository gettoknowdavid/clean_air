import 'dart:convert';
import 'dart:io';

import 'package:clean_air/core/keys.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';
import 'package:http/http.dart' as http;

class MediaService with ListenableServiceMixin {
  final _picker = ImagePicker();
  final _firebaseStorage = FirebaseStorage.instance;

  Reference get storageRef => _firebaseStorage.ref();

  dynamic getFileFromCloud(Reference ref) async {
    final result = await ref.getDownloadURL();

    final response = await http.get(Uri.parse(result));
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String base64Image = base64Encode(response.bodyBytes);
    await _pref.setString(kProfileImageKey, base64Image);

    return result;
  }

  Future<XFile?> getImage({required bool fromGallery}) async {
    return await _picker.pickImage(
      source: fromGallery ? ImageSource.gallery : ImageSource.camera,
    );
  }

  dynamic uploadFileToCloud(String path, String name, Reference ref) async {
    File file = File(path);
    try {
      await ref.putFile(file);
    } on FirebaseException {
      // _logger.e(e.message);
    }
  }
}
