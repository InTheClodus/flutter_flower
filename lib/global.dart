import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_flower/utils/local_storage.dart';
import 'package:flutter_flower/utils/storage.dart';
import 'package:get/get_connect/http/src/request/request.dart';


import 'models/user_entity.dart';

/// 全局配置
class Global {
  /// 用户配置
  static UserEntity? profile = UserEntity(token: null);

  /// 是否离线登录
  static bool isOfflineLogin = false;

  /// 是否 release
  static bool get isRelease => bool.fromEnvironment("dart.vm.product");

  /// init
  static Future init() async {
    // 运行初始
    WidgetsFlutterBinding.ensureInitialized();
    await LoacalStorage.init();
    // 读取离线用户信息
    var _profileJSON = LoacalStorage().getJSON(STORAGE_USER_PROFILE_KEY);
    if (_profileJSON != null) {
      profile = UserEntity.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

    // android 状态栏为透明的沉浸
    if (Platform.isAndroid) {
      SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(statusBarColor: Colors.transparent);
      SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
    }
  }

  // 持久化 用户信息
  static Future<bool> saveProfile(UserEntity userResponse) {
    profile = userResponse;
    return LoacalStorage().setJSON(STORAGE_USER_PROFILE_KEY, userResponse.toJson());
  }
}
