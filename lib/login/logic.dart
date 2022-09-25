import 'package:flutter/cupertino.dart';
import 'package:flutter_flower/global.dart';
import 'package:flutter_flower/home/view.dart';
import 'package:flutter_flower/models/user_entity.dart';
import 'package:get/get.dart';

import '../net/dio_utils.dart';
import 'state.dart';

class LoginLogic extends GetxController {
  final LoginState state = LoginState();
  final TextEditingController userNameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void login() {
    DioUtils.instance.requestNetwork<UserEntity>(Method.post, "user/login",
        queryParameters: {
          "name": userNameController.text,
          "password": passwordController.text
        }, onSuccess: (e) {
      Global.saveProfile(e!);
      Get.to(HomePage());
    }, onError: (code, err) {
      print("$code----$err");
    });
  }

  @override
  void onClose() {
    userNameController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
