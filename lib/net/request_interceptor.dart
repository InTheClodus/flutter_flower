import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

/// 请求处理拦截器
class RequestInterceptor extends Interceptor {
  @override
  onRequest(options, handle) {
    // // 设置cookie

    // options.headers['User-Agent'] = 'gzzoc-1';//
    //multipart/form-data
    // options.headers['content-type'] = 'application/json';
    print("===================onRequest START================");
    print(options.uri.toString());
    print(options.data.toString());
    print(options.queryParameters.toString());
    print(options.headers.toString());
    print("===================onRequest END================");

    handle.next(options);
    //return super.onRequest(options);
  }

  @override
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    print("===================onResponse START================");
    print(response.data.toString());
    print("===================onResponse END================");
    super.onResponse(response, handler);
  }

  @override
  onError(err, handle) {
    // Alert.hide();关闭弹窗
    print("===================onError START================");
    print(err.toString());
    print("===================onError END================");

    return super.onError(err, handle);
  }
}
