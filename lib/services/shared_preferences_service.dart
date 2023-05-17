import 'dart:convert';
import 'dart:typed_data';

import 'package:clean_air/core/keys.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

class SharedPreferencesService {
  static late SharedPreferencesService _instance;
  static late SharedPreferences _pref;

  bool get isInitialStartup {
    if (_pref.containsKey(kInitKey)) {
      return false;
    } else {
      return true;
    }
  }

  Future delete(String key) async {
    return await _pref.remove(key);
  }

  bool hasKey(String key) => _pref.containsKey(key);

  dynamic read(String key) {
    return _pref.get(key);
  }

  dynamic readList(String key) {
    return _pref.getStringList(key);
  }

  Future write({required String key, required dynamic value}) async {
    if (value is bool) {
      _pref.setBool(key, value);
    } else if (value is String) {
      _pref.setString(key, value);
    } else if (value is int) {
      _pref.setInt(key, value);
    } else if (value is double) {
      _pref.setDouble(key, value);
    }
  }

  Future writeList({required String key, required List<String> value}) async {
    await _pref.setStringList(key, value);
  }

  static Future<SharedPreferencesService> getInstance() async {
    _pref = await SharedPreferences.getInstance();
    _instance = SharedPreferencesService();

    return Future.value(_instance);
  }

  Future<bool> writeImage(List<int> imageBytes) async {
    String base64Image = base64Encode(imageBytes);
    return await _pref.setString(kProfileImageKey, base64Image);
  }

  Future<bool> writeImageFromNetwork(String url) async {
    final response = await http.get(Uri.parse(url));
    SharedPreferences _pref = await SharedPreferences.getInstance();
    String base64Image = base64Encode(response.bodyBytes);
    return await _pref.setString(kProfileImageKey, base64Image);
  }

  Future<Image?> readImage(String key) async {
    if (_pref.containsKey(key)) {
      Uint8List bytes = base64Decode(_pref.getString(key)!);
      return Image.memory(bytes);
    } else {
      return null;
    }
  }
}
