import 'package:flutter/material.dart';
import 'package:flutter_flower/global.dart';
import 'package:flutter_flower/login/view.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

import 'net/dio_utils.dart';
import 'net/request_interceptor.dart';

void main()=>Global.init().then((value){
  configDio(
      baseUrl: 'http://192.168.1.3:8989/',
      interceptors: [RequestInterceptor()]);
  runApp(const MyApp());
});

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
      home: LoginPage(),
    );
  }
}